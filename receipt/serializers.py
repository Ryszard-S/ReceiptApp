from django.contrib.auth.models import User
from rest_framework import serializers
from django.core.exceptions import ObjectDoesNotExist

from .models import Shop, Item, Receipt, Category


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id']


class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ['id', 'name']


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

    def create(self, validated_data):
        user = User.objects.get(id=self.context.get('user_id'))
        new_category: str = validated_data.get('name')
        new_category.strip().lower()
        try:
            category = Category.objects.get(name=new_category)
        except:
            category = None
        if category is not None:
            category.user.add(user)
        else:
            category = Category.objects.create(name=new_category)
            category.user.add(user)

        return category

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name')
        instance.save()
        return instance


class ItemSerializer(serializers.ModelSerializer):
    category = CategorySerializer(many=False, read_only=False)
    id = serializers.IntegerField(required=False)

    class Meta:
        model = Item
        fields = ['id', 'name', 'price', 'category']

    def create(self, validated_data, *args, **kwargs):
        user = self.context.get('user')
        receipt_id = self.context.get('receipt_id')
        category_name = validated_data.pop('category')
        try:
            receipt = Receipt.objects.get(user=user, id=receipt_id)
            category = Category.objects.get(user=user, name=category_name['name'])
            item = Item.objects.create(**validated_data, receipt=receipt, category=category)
        except ObjectDoesNotExist:
            raise serializers.ValidationError()

        return item


class ReceiptSerializer(serializers.ModelSerializer):
    items = ItemSerializer(many=True, read_only=False)
    shop = ShopSerializer(many=False, read_only=False)

    class Meta:
        model = Receipt
        fields = ['id', 'shop', 'date', 'created_at', 'updated_at', 'items']

    def create(self, validated_data, *args, **kwargs):
        items = validated_data.pop('items')
        user_id = self.context.get('user_id')
        user = User.objects.get(id=user_id)
        shop_name = validated_data.pop('shop')
        try:
            shop = Shop.objects.get(name=shop_name.get('name'))
        except ObjectDoesNotExist:
            raise serializers.ValidationError(detail={'shop': 'Shop does not exist'})
        receipt = Receipt.objects.create(user=user, **validated_data, shop=shop)

        items_list = []
        for item in items:
            category_name = item.pop('category')
            try:
                category = Category.objects.get(name=category_name.get('name'), user=user)
            except ObjectDoesNotExist:
                raise serializers.ValidationError(detail={'category': 'Category does not exist'})
            items_list.append(Item(receipt=receipt, **item, category=category))

        Item.objects.bulk_create(items_list)
        return receipt

    def update(self, instance, validated_data):
        print('instance: ', instance)
        items = validated_data.pop('items')
        shop_name = validated_data.pop('shop')
        shop = Shop.objects.get(name=shop_name.get('name'))
        instance.shop = shop
        instance.date = validated_data.get('date', instance.date)
        instance.save()

        instance_items = instance.items
        print('instance_items:', instance_items)
        current_items_in_receipt = Item.objects.filter(receipt=instance.pk).values_list('id', flat=True)
        print('current_items_in_receipt', current_items_in_receipt)

        for i in current_items_in_receipt:
            print(i)

        keep_items = []
        for item in items:
            category_name = item.pop('category')
            category = Category.objects.get(name=category_name.get('name'))
            if 'id' in item.keys():
                if Item.objects.filter(id=item['id']).exists():
                    i = Item.objects.get(id=item['id'])
                    i.name = item.get('name', i.name)
                    i.price = item.get('price', i.price)
                    i.category = category
                    i.save()
                    keep_items.append(i.id)
                else:
                    continue
            else:
                i = Item.objects.create(receipt=instance, category=category, **item)
                keep_items.append(i.id)
        print(keep_items)
        for item_id in current_items_in_receipt:
            if item_id not in keep_items:
                Item.objects.filter(pk=item_id).delete()

        print(keep_items)
        return instance

from rest_framework import serializers
from .models import Shop, Item, Receipt


class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ['id', 'name']


class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = ['id', 'name', 'price', 'category']


class ReceiptSerializer(serializers.ModelSerializer):
    items = ItemSerializer(many=True, read_only=False)

    # items = serializers.PrimaryKeyRelatedField(many=True)

    class Meta:
        model = Receipt
        fields = ['id', 'shop', 'date', 'items']

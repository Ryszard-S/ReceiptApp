# Create your views here.
from django.contrib.auth.models import User
from rest_framework import generics, permissions
from rest_framework.response import Response

from receipt.models import Shop, Receipt, Category
from receipt.serializers import ShopSerializer, ReceiptSerializer, CategorySerializer, ItemSerializer

import time


class ShopListView(generics.ListAPIView):
    queryset = Shop.objects.all()
    serializer_class = ShopSerializer
    lookup_field = ['name']

    def get_queryset(self, *args, **kwargs):
        qs = Shop.objects.all()
        name = self.request.query_params.get('name')
        time.sleep(5)
        if name is not None:
            qs = qs.filter(name__icontains=name)
        return qs


class ReceiptsListAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ReceiptSerializer

    def get_queryset(self):
        user = self.request.user
        qs = Receipt.objects.filter(user=user)
        return qs


class ReceiptsListCreateAPIView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ReceiptSerializer

    def get_queryset(self):
        user = self.request.user
        qs = Receipt.objects.filter(user=user)
        return qs

    def create(self, request, *args, **kwargs):
        user_id = self.request.user.id
        data = self.request.data
        serializer = self.get_serializer(
            data=data, context={'user_id': user_id})
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return Response(data=data)


class CategoryListCreateAPIView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CategorySerializer

    def get_queryset(self):
        user = self.request.user
        qs = Category.objects.filter(user=user)
        return qs

    def create(self, request, *args, **kwargs):
        user_id = self.request.user.id
        data = self.request.data
        serializer = self.get_serializer(
            data=data, context={'user_id': user_id})
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return Response(data=serializer.data)


class CategoryDestroyAPIView(generics.DestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CategorySerializer
    queryset = Category.objects.all()

    def destroy(self, request, *args, **kwargs):
        user = self.request.user
        try:
            category = Category.objects.get(id=kwargs['pk'], user=user)
            category.user.remove(user)
        except:
            return Response(status=404, data={'message': 'Category not found'})

        return Response(data={'message': 'ok'})


class ItemCreateAPIView(generics.CreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ItemSerializer

    def get_queryset(self):
        user = self.request.user
        qs = Category.objects.filter(user=user)
        return qs

    def create(self, request, *args, **kwargs):
        user = self.request.user
        data = self.request.data
        receipt_id = kwargs.get('pk')
        serializer = self.get_serializer(
            data=data, context={'user': user, 'receipt_id': receipt_id})
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return Response(data=serializer.data)

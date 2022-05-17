# Create your views here.
from django.contrib.auth.models import User
from rest_framework import generics, permissions
from rest_framework.response import Response

from receipt.models import Shop, Receipt, Category
from receipt.serializers import ShopSerializer, ReceiptSerializer, CategorySerializer


class ShopListView(generics.ListAPIView):
    queryset = Shop.objects.all()
    serializer_class = ShopSerializer
    lookup_field = ['name']

    # lookup_url_kwarg = ['name']

    def get_queryset(self):
        print(self.request.query_params)
        qs = Shop.objects.all()
        name = self.request.query_params.get('name')
        if name is not None:
            qs = qs.filter(name__icontains=name)
        return qs


class ReceiptsListAPIView(generics.ListAPIView):
    # queryset = Receipt.objects.filter(user=user)
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ReceiptSerializer

    def get_queryset(self):
        user = self.request.user
        print(user)
        qs = Receipt.objects.filter(user=user)
        return qs


class ReceiptsListCreateAPIView(generics.ListCreateAPIView):
    # queryset = Receipt.objects.filter(user=user)
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ReceiptSerializer

    def get_queryset(self):
        user = self.request.user
        qs = Receipt.objects.filter(user=user)
        return qs

    def create(self, request, *args, **kwargs):
        user_id = self.request.user.id
        data = self.request.data
        serializer = self.get_serializer(data=data, context={'user_id': user_id})
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
        serializer = self.get_serializer(data=data, context={'user_id': user_id})
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        return Response(data=serializer.data)

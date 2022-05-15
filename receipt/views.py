# Create your views here.
from rest_framework import generics, permissions

from receipt.models import Shop, Receipt
from receipt.serializers import ShopSerializer, ReceiptSerializer


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
    queryset = Receipt.objects.all()
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = ReceiptSerializer

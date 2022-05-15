# Create your views here.
from rest_framework import generics

from receipt.models import Shop
from receipt.serializers import ShopSerializer


class ShopListView(generics.ListAPIView):
    print()
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




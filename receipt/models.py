from django.db import models
from django.contrib.auth.models import User


# Create your models here.

class Shop(models.Model):
    name = models.CharField(max_length=100)


class Receipt(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    shop = models.ForeignKey(Shop, on_delete=models.SET_NULL, null=True, blank=True)
    date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)


class Item(models.Model):
    receipt = models.ForeignKey(Receipt, related_name='items', on_delete=models.CASCADE)
    name = models.CharField(max_length=130)
    price = models.DecimalField(max_digits=15, decimal_places=2, default=0)
    category = models.ForeignKey('Category', models.DO_NOTHING, blank=True, null=True)


class Category(models.Model):
    name = models.CharField(max_length=50)
    user = models.ManyToManyField(User)

    def __str__(self):
        return f'Category name: {self.name}'

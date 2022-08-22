from django.urls import path, re_path
# from views import front
from . import views

urlpatterns = [
    # path('', views.index),
    # path('login', views.index),
    # path('register', views.index),
    re_path(r"^(?:.*)?$", views.index),
]

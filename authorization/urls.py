from django.urls import path
from rest_framework.authtoken import views

from authorization.views import UserCreateAPIView, UserDestroyAPIView, test

urlpatterns = [
    path('login/', views.obtain_auth_token),
    path('signup/', UserCreateAPIView.as_view()),
    path('logout/', UserDestroyAPIView.as_view()),
    path('test/', test.as_view())
]

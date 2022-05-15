from rest_framework import generics, authentication, permissions, status
from django.contrib.auth.models import User
from rest_framework.response import Response

from .authentication import TokenAuthentication

from .serializers import UserSerializer


class UserCreateAPIView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class UserDestroyAPIView(generics.DestroyAPIView):
    # authentication_classes = [TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def destroy(self, request, *args, **kwargs):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_204_NO_CONTENT, data={"status": "logout"})


class test(generics.ListAPIView):
    queryset = User.objects.all()
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request, *args, **kwargs):
        return Response(data={"OK": 'ok'}, status=status.HTTP_200_OK)

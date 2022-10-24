from django.urls import path, include

from . import views

urlpatterns = [
    # path('', views.product_create_view),
    # path('<int:pk>/update', views.product_update_view),
    # path('<int:pk>/create', views.product_create_view),
    #
    # path('<int:pk>/', views.product_detail_view)
    path('', views.ShopListView.as_view()),
    path('receipts/<int:pk>/', views.ReceiptRetrieveUpdateDestroyAPIView.as_view()),
    path('receipts/', views.ReceiptsListCreateAPIView.as_view()),
    path('receipts/category/', views.CategoryListCreateAPIView.as_view()),
    path('receipts/category/<int:pk>/', views.CategoryDestroyAPIView.as_view()),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))

    # path('<int:pk>/', views.ShopRetrieveView.as_view()),
]

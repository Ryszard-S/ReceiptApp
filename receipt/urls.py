from django.urls import path

from . import views

urlpatterns = [
    # path('', views.product_create_view),
    # path('<int:pk>/update', views.product_update_view),
    # path('<int:pk>/create', views.product_create_view),
    #
    # path('<int:pk>/', views.product_detail_view)
    path('', views.ShopListView.as_view()),
    path('receipts/', views.ReceiptsListAPIView.as_view()),
    path('receipts/create/', views.ReceiptsListCreateAPIView.as_view()),
    path('receipts/category/', views.CategoryListCreateAPIView.as_view()),
    path('receipts/category/<int:pk>/delete/', views.CategoryDestroyAPIView.as_view()),
    # path('<int:pk>/', views.ShopRetrieveView.as_view()),
]

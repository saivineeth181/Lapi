from django.urls import path

from . import views

urlpatterns = [
    path('',views.Inventory_view,name="api-overview"),
    path('create',views.Inventory_create,name='create_task'),
    path('update/<str:pk>',views.Inventory_update,name='update_task'),
    path('delete/<str:pk>',views.Inventory_delete,name='delete_task'),
    path('create_cam',views.Inventory_cam,name='create_cam'),
    path('User',views.User_view,name="User-overview"),
    path('Usercreate',views.User_create,name='Usercreate_task'),
    path('Userupdate/<str:pk>',views.User_update,name='Userupdate_task'),
    path('Userdelete/<str:pk>',views.User_delete,name='Userdelete_task'),
]
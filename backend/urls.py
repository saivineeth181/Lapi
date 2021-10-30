from django.urls import path

from . import views

urlpatterns = [
    path('',views.Inventory_view,name="api-overview"),
    path('create',views.Inventory_create,name='create_task'),
    path('update/<str:pk>',views.Inventory_update,name='update_task'),
    path('delete/<str:pk>',views.Inventory_delete,name='delete_task'),
    path('create_cam',views.Inventory_cam,name='create_cam'),
    path('patrons',views.Patrons_view,name="Patrons_overview"),
    path('patronscreate',views.Patrons_create,name='Patronscreate_task'),
    path('patronsupdate/<str:pk>',views.Patrons_update,name='Patronsupdate_task'),
    path('patronsdelete/<str:pk>',views.Patrons_delete,name='Patronsdelete_task'),
]
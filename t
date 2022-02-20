[33mcommit 76b2461ae87988cfc73baa6686c70b036b04cbff[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: saivineeth181 <saivineeth181@gmail.com>
Date:   Sun Feb 20 18:57:19 2022 +0530

    vamsi

[1mdiff --git a/api/__pycache__/settings.cpython-39.pyc b/api/__pycache__/settings.cpython-39.pyc[m
[1mindex 7823c16..13f1880 100644[m
Binary files a/api/__pycache__/settings.cpython-39.pyc and b/api/__pycache__/settings.cpython-39.pyc differ
[1mdiff --git a/api/settings.py b/api/settings.py[m
[1mindex ea98640..d8a52b0 100644[m
[1m--- a/api/settings.py[m
[1m+++ b/api/settings.py[m
[36m@@ -37,8 +37,10 @@[m [mINSTALLED_APPS = [[m
     'django.contrib.sessions',[m
     'django.contrib.messages',[m
     'django.contrib.staticfiles',[m
[32m+[m[41m    [m
     'rest_framework',[m
[31m-    'backend'[m
[32m+[m[32m    'backend',[m
[32m+[m[32m    'vamsi',[m
 ][m
 [m
 MIDDLEWARE = [[m
[1mdiff --git a/api/urls.py b/api/urls.py[m
[1mindex f6dff0f..a9932d1 100644[m
[1m--- a/api/urls.py[m
[1m+++ b/api/urls.py[m
[36m@@ -22,6 +22,7 @@[m [mfrom django.conf.urls.static import static[m
 urlpatterns = [[m
     path('admin/', admin.site.urls),[m
     path('api/', include('backend.urls')),[m
[32m+[m[32m    path('vamsi/', include('vamsi.urls')),[m
 ][m
 [m
 urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)[m
\ No newline at end of file[m
[1mdiff --git a/backend/__pycache__/serializers.cpython-39.pyc b/backend/__pycache__/serializers.cpython-39.pyc[m
[1mindex c6003e8..52be3b1 100644[m
Binary files a/backend/__pycache__/serializers.cpython-39.pyc and b/backend/__pycache__/serializers.cpython-39.pyc differ
[1mdiff --git a/db.sqlite3 b/db.sqlite3[m
[1mindex 69fa5b9..30a9a1f 100644[m
Binary files a/db.sqlite3 and b/db.sqlite3 differ
[1mdiff --git a/vamsi/__init__.py b/vamsi/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/vamsi/admin.py b/vamsi/admin.py[m
[1mnew file mode 100644[m
[1mindex 0000000..04e36f3[m
[1m--- /dev/null[m
[1m+++ b/vamsi/admin.py[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32mfrom django.contrib import admin[m
[32m+[m
[32m+[m[32mfrom .models import Item,Inventory,Sale[m
[32m+[m
[32m+[m[32madmin.site.register(Item)[m
[32m+[m[32madmin.site.register(Inventory)[m
[32m+[m[32madmin.site.register(Sale)[m
\ No newline at end of file[m
[1mdiff --git a/vamsi/apps.py b/vamsi/apps.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e9cb46f[m
[1m--- /dev/null[m
[1m+++ b/vamsi/apps.py[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mfrom django.apps import AppConfig[m
[32m+[m
[32m+[m
[32m+[m[32mclass VamsiConfig(AppConfig):[m
[32m+[m[32m    default_auto_field = 'django.db.models.BigAutoField'[m
[32m+[m[32m    name = 'vamsi'[m
[1mdiff --git a/vamsi/migrations/__init__.py b/vamsi/migrations/__init__.py[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/vamsi/models.py b/vamsi/models.py[m
[1mnew file mode 100644[m
[1mindex 0000000..36663f0[m
[1m--- /dev/null[m
[1m+++ b/vamsi/models.py[m
[36m@@ -0,0 +1,35 @@[m
[32m+[m[32mfrom django.db import models[m
[32m+[m
[32m+[m[32mclass Item(models.Model):[m
[32m+[m[32m    item = models.CharField(max_length=100,unique=True)[m
[32m+[m
[32m+[m[32m    def __str__(self) -> str:[m
[32m+[m[32m        return self.item[m
[32m+[m
[32m+[m[32mclass Inventory(models.Model):[m
[32m+[m[32m    item = models.ForeignKey(Item,on_delete=models.CASCADE,to_field='item')[m
[32m+[m[32m    quantity = models.IntegerField(default=0)[m
[32m+[m[32m    describe = models.CharField(max_length=100,null=True)[m
[32m+[m[32m    created_date = models.DateTimeField(auto_now_add=True)[m
[32m+[m[32m    updated_date = models.DateTimeField(auto_now=True)[m
[32m+[m[41m    [m
[32m+[m[32m    def __str__(self) -> str:[m
[32m+[m[32m        return self.item.item[m
[32m+[m
[32m+[m[32mclass Sale(models.Model):[m
[32m+[m
[32m+[m[32m    MY_CHOICES = ([m
[32m+[m[32m        ('sold', 'sold'),[m
[32m+[m[32m        ('buy', 'buy'),[m
[32m+[m[32m    )[m
[32m+[m
[32m+[m[32m    item = models.ForeignKey(Item,on_delete=models.CASCADE,to_field='item')[m
[32m+[m[32m    quantity = models.IntegerField()[m
[32m+[m[32m    describe = models.CharField(max_length=100,null=True)[m
[32m+[m[32m    created_date = models.DateTimeField(auto_now_add=True)[m
[32m+[m[32m    updated_date = models.DateTimeField(auto_now=True)[m
[32m+[m[32m    sold_or_buy = models.CharField(max_length=50, choices=MY_CHOICES)[m
[32m+[m
[32m+[m[32m    def __str__(self) -> str:[m
[32m+[m[32m        return self.item.item[m
[32m+[m
[1mdiff --git a/vamsi/serializers.py b/vamsi/serializers.py[m
[1mnew file mode 100644[m
[1mindex 0000000..d2dc47e[m
[1m--- /dev/null[m
[1m+++ b/vamsi/serializers.py[m
[36m@@ -0,0 +1,26 @@[m
[32m+[m[32mfrom rest_framework import serializers[m
[32m+[m[32mfrom .models import Item,Inventory,Sale[m
[32m+[m
[32m+[m[32mclass Itemserializer(serializers.ModelSerializer):[m
[32m+[m[32m    class Meta:[m
[32m+[m[32m        model = Item[m
[32m+[m[32m        fields = '__all__'[m
[32m+[m
[32m+[m
[32m+[m[32mclass Inventoryserializer(serializers.ModelSerializer):[m
[32m+[m[32m    class Meta:[m
[32m+[m[32m        model = Inventory[m
[32m+[m[32m        fields = '__all__'[m
[32m+[m
[32m+[m[32mclass Saleserializer(serializers.ModelSerializer):[m
[32m+[m[32m    def update(self, instance, validated_data):[m
[32m+[m[32m        instance.quantity = validated_data.get('quantity', instance.quantity)[m
[32m+[m[32m        instance.sold_or_buy = validated_data.get('sold_or_buy', instance.sold_or_buy)[m
[32m+[m[32m        instance.item = validated_data.get('item', instance.item)[m
[32m+[m[32m        instance.save()[m
[32m+[m[32m        return instance[m
[32m+[m[41m    [m
[32m+[m[41m    [m
[32m+[m[32m    class Meta:[m
[32m+[m[32m        model = Sale[m
[32m+[m[32m        fields = '__all__'[m
[1mdiff --git a/vamsi/tests.py b/vamsi/tests.py[m
[1mnew file mode 100644[m
[1mindex 0000000..7ce503c[m
[1m--- /dev/null[m
[1m+++ b/vamsi/tests.py[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32mfrom django.test import TestCase[m
[32m+[m
[32m+[m[32m# Create your tests here.[m
[1mdiff --git a/vamsi/urls.py b/vamsi/urls.py[m
[1mnew file mode 100644[m
[1mindex 0000000..b34ccee[m
[1m--- /dev/null[m
[1m+++ b/vamsi/urls.py[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32mfrom django.urls import path[m
[32m+[m
[32m+[m[32mfrom .views import items,Inventorys,Sales[m
[32m+[m
[32m+[m[32murlpatterns = [[m
[32m+[m[32m    #items[m
[32m+[m[32m    path('item/get', items.get,name="itemget"),[m
[32m+[m[32m    path("item/post",items.post,name="itempost"),[m
[32m+[m[32m    path("item/update/<int:pk>",items.update,name="itemupdate"),[m
[32m+[m[32m    path("item/delete/<int:pk>",items.delete,name="itemdelete"),[m
[32m+[m
[32m+[m[32m    #inventory[m
[32m+[m[32m    path('inventory/get', Inventorys.get,name="Inventoryget"),[m
[32m+[m[32m    # path("inventory/post",Inventorys.post,name="Inventorypost"),[m
[32m+[m[32m    # path("inventory/update",Inventorys.update,name="Inventoryupdate"),[m
[32m+[m[32m    # path("inventory/detele",Inventorys.delete,name="Inventorydelete"),[m
[32m+[m
[32m+[m[32m    #sale[m
[32m+[m[32m    path('sale/get', Sales.get,name="Saleget"),[m
[32m+[m[32m    path("sale/post",Sales.post,name="Salepost"),[m
[32m+[m[32m    path("sale/update/<int:pk>",Sales.update,name="Saleupdate"),[m
[32m+[m[32m    path("sale/delete/<int:pk>",Sales.delete,name="Saledelete"),[m
[32m+[m
[32m+[m[32m][m
[1mdiff --git a/vamsi/views.py b/vamsi/views.py[m
[1mnew file mode 100644[m
[1mindex 0000000..17d8eaa[m
[1m--- /dev/null[m
[1m+++ b/vamsi/views.py[m
[36m@@ -0,0 +1,193 @@[m
[32m+[m[32mfrom django.shortcuts import render[m
[32m+[m[32mfrom django.core import exceptions[m
[32m+[m
[32m+[m[32mfrom rest_framework.decorato
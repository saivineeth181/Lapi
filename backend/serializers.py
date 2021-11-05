from typing import Sequence
from django.db import models
from django.db.models import fields
from rest_framework import serializers
from .models import List, inventory,Patrons

class inventorySerializer(serializers.ModelSerializer):
    class Meta:
        model = inventory
        fields = "__all__"

class PatronsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patrons
        fields = "__all__"

class ListSerializer(serializers.ModelSerializer):
    book_pic = serializers.ReadOnlyField(source='title.book_over_pic') 
    name = serializers.CharField()
    title = serializers.CharField()
    
    class Meta:
        model = List
        fields = ('name','title','book_pic','quantity','status')
    
    def create(self, validated_data):
        name = validated_data.pop('name')
        title = validated_data.pop('title')
        name_instance, created_name = Patrons.objects.get_or_create(name=name)
        title_instance, created_title = inventory.objects.get_or_create(title=title)
        List_instance = List.objects.create(**validated_data,name=name_instance,title=title_instance)
        return List_instance
    
    def update(self, instance, validated_data):
        instance.name = Patrons.objects.get(name=validated_data['name'])
        instance.title = inventory.objects.get(title=validated_data['title'])
        instance.quantity = int(instance.quantity) - int(validated_data['quantity'])
        instance.status = validated_data['status']
        instance.save()
        return instance
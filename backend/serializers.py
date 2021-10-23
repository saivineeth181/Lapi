from typing import Sequence
from django.db import models
from django.db.models import fields
from rest_framework import serializers
from .models import inventory,Users

class inventorySerializer(serializers.ModelSerializer):
    class Meta:
        model = inventory
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = "__all__"
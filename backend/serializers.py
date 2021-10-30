from typing import Sequence
from django.db import models
from django.db.models import fields
from rest_framework import serializers
from .models import inventory,Patrons

class inventorySerializer(serializers.ModelSerializer):
    class Meta:
        model = inventory
        fields = "__all__"

class PatronsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patrons
        fields = "__all__"
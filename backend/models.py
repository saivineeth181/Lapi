from typing import DefaultDict
from django.db import models
from django.utils.translation import gettext_lazy as _


def upload_to(instance,filename):
    return 'User/{filename}'.format(filename=filename)

class inventory(models.Model):
    
    title = models.CharField(max_length=1000,blank=False)
    book_over_pic = models.CharField(max_length=50000)
    quantity = models.IntegerField(blank=False,default=0)

    def __str__(self):
        return self.title

class Patrons(models.Model):
    name = models.CharField(max_length=50,blank=False)
    User_photo = models.ImageField(_("Image"),upload_to=upload_to,default='User/default.png')
    no_of_books = models.IntegerField(_("noofbooks"),default=0)
    def __str__(self):
        return self.name
    
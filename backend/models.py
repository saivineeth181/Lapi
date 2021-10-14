from django.db import models

class inventory(models.Model):
    
    title = models.CharField(max_length=1000,blank=False)
    book_over_pic = models.CharField(max_length=50000)
    quantity = models.IntegerField(blank=False,default=0)

    def __str__(self):
        return self.title


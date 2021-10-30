# Generated by Django 3.2.3 on 2021-10-30 03:26

import backend.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0004_alter_users_user_photo'),
    ]

    operations = [
        migrations.CreateModel(
            name='Patrons',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('User_photo', models.ImageField(default='User/default.png', upload_to=backend.models.upload_to, verbose_name='Image')),
                ('no_of_books', models.IntegerField(default=0, verbose_name='noofbooks')),
            ],
        ),
        migrations.DeleteModel(
            name='Users',
        ),
    ]

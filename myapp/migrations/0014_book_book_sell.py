# Generated by Django 3.2.8 on 2022-03-23 22:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0013_remove_book_book'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='book_sell',
            field=models.ForeignKey(default='0', on_delete=django.db.models.deletion.CASCADE, to='myapp.user'),
        ),
    ]

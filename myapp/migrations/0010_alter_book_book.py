# Generated by Django 3.2.8 on 2022-03-23 20:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0009_alter_book_book'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='book',
            field=models.ForeignKey(default='1', on_delete=django.db.models.deletion.CASCADE, to='myapp.user'),
        ),
    ]

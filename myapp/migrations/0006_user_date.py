# Generated by Django 4.0.3 on 2022-03-28 19:26

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0005_alter_book_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='date',
            field=models.DateField(auto_now_add=True, default=datetime.date.today),
            preserve_default=False,
        ),
    ]

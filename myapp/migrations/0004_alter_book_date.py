# Generated by Django 4.0.3 on 2022-03-28 19:14

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0003_book_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='date',
            field=models.DateField(auto_created=True, default=datetime.date.today),
        ),
    ]

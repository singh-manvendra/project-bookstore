# Generated by Django 4.0.3 on 2022-03-22 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0004_contact'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='user_img',
            field=models.ImageField(blank=True, default='', null=True, upload_to='images/'),
        ),
        migrations.AlterField(
            model_name='book',
            name='book_image',
            field=models.ImageField(blank=True, default='', null=True, upload_to='images/'),
        ),
    ]
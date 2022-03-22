# Generated by Django 4.0.3 on 2022-03-22 17:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_alter_user_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('book_name', models.CharField(max_length=100)),
                ('book_cat', models.IntegerField()),
                ('book_price', models.IntegerField()),
                ('book_description', models.TextField()),
                ('book_image', models.ImageField(upload_to='images/')),
            ],
        ),
    ]
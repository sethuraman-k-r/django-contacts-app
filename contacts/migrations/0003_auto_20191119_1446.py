# Generated by Django 2.2.7 on 2019-11-19 14:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contacts', '0002_auto_20191119_1446'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='first_user_name',
            new_name='first_name',
        ),
    ]

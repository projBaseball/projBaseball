# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-24 00:56
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='createDate',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
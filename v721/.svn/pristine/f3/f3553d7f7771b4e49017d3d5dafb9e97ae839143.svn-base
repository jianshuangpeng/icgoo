# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ShoppingCart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('creat_time', models.DateTimeField(auto_now_add=True)),
                ('modify_time', models.DateTimeField(auto_now=True)),
                ('refresh_time', models.DateTimeField(auto_now_add=True)),
                ('qty', models.IntegerField()),
                ('icg_partno', models.CharField(max_length=37, db_index=True)),
                ('partno', models.CharField(max_length=50)),
                ('mfr', models.CharField(max_length=50)),
                ('supplier', models.CharField(max_length=20)),
                ('min_qty', models.IntegerField(blank=True)),
                ('mult', models.IntegerField(blank=True)),
                ('stock', models.IntegerField(default=0)),
                ('stock_new', models.IntegerField(default=0)),
                ('price_calc', models.TextField(blank=True)),
                ('price_calc_new', models.TextField(blank=True)),
                ('price_change', models.IntegerField(default=0, choices=[(0, b'invariant'), (1, b'up'), (-1, b'down')])),
                ('status', models.IntegerField(default=1, choices=[(1, b'normal'), (2, b'commit'), (3, b'del'), (4, b'disappear')])),
                ('can_refresh', models.BooleanField(default=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]

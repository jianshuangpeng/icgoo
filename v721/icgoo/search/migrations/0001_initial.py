# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Supplier',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=50, verbose_name='\u4f9b\u5e94\u5546\u540d\u79f0')),
                ('desc', models.CharField(default=b'', max_length=50, verbose_name='\u7b80\u4ecb')),
                ('info', models.CharField(default=b'', max_length=50, verbose_name='\u4f18\u60e0\u4fe1\u606f')),
                ('logo', models.CharField(default=b'', max_length=50, verbose_name='logo\u540d\u79f0')),
                ('is_good', models.BooleanField(default=True, verbose_name='\u662f\u5426\u63a8\u8350')),
                ('is_active', models.BooleanField(default=True, verbose_name='\u662f\u5426\u6709\u6548')),
            ],
        ),
    ]

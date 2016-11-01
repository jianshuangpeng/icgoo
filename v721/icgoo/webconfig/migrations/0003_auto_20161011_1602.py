# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webconfig', '0002_auto_20151021_1542'),
    ]

    operations = [
        migrations.AlterField(
            model_name='webconfig',
            name='value',
            field=models.CharField(max_length=500),
        ),
    ]

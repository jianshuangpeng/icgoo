# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Descript',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=50, verbose_name='\u6807\u9898')),
                ('content', models.CharField(max_length=50, verbose_name='\u5185\u5bb9')),
            ],
        ),
        migrations.CreateModel(
            name='Pictures',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u56fe\u7247\u540d\u79f0')),
                ('position', models.CharField(max_length=10, verbose_name='\u663e\u793a\u4f4d\u7f6e', choices=[(b'top', '\u9876\u90e8\u901a\u77e5'), (b'center', '\u4e2d\u95f4\u5e7f\u544a'), (b'logo', 'LOGO'), (b'small', '\u5c0f\u5e7f\u544a')])),
                ('explain', models.CharField(default=b'#', max_length=100, verbose_name='\u56fe\u7247\u63cf\u8ff0')),
                ('href', models.CharField(default=b'#', max_length=200, verbose_name='\u56fe\u7247\u8fde\u63a5')),
                ('uploaddate', models.DateField(verbose_name='\u4e0a\u4f20\u65f6\u95f4', blank=True)),
                ('showdate', models.DateTimeField(null=True, verbose_name='\u56fe\u7247\u663e\u793a\u65f6\u95f4', blank=True)),
                ('hidedate', models.DateTimeField(null=True, verbose_name='\u56fe\u7247\u9690\u85cf\u65f6\u95f4', blank=True)),
                ('imgpath', models.CharField(max_length=200, verbose_name='\u56fe\u7247\u5730\u5740')),
                ('show_id', models.IntegerField(default=999, verbose_name='\u663e\u793a\u987a\u5e8f')),
                ('show', models.BooleanField(default=False, verbose_name='\u6b63\u5728\u663e\u793a')),
            ],
        ),
    ]

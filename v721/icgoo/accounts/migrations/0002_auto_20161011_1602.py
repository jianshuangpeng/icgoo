# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserAddressInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('address', models.CharField(default=b'', max_length=200, verbose_name='\u6536\u8d27\u5730\u5740')),
                ('name', models.CharField(default=b'', max_length=50, verbose_name='\u6536\u8d27\u4eba')),
                ('phone', models.CharField(default=b'', max_length=15, verbose_name='\u6536\u8d27\u4eba\u624b\u673a\u53f7')),
                ('isdefault', models.BooleanField(default=False, verbose_name='\u662f\u5426\u9ed8\u8ba4')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserExtraInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('jy_partner_id', models.CharField(max_length=100, null=True, verbose_name='jy_partner_id', blank=True)),
                ('user', models.OneToOneField(related_name='jyinfo', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserRegisterInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(default=b'company', max_length=25, verbose_name='\u6ce8\u518c\u7c7b\u578b', choices=[(b'personal', '\u4e2a\u4eba'), (b'company', '\u4f01\u4e1a')])),
                ('company_name', models.CharField(max_length=200, verbose_name='\u516c\u53f8\u540d\u79f0')),
                ('phone', models.CharField(max_length=20, null=True, verbose_name='\u624b\u673a\u53f7\u7801', blank=True)),
                ('area_code', models.CharField(max_length=10, null=True, verbose_name='\u56fa\u5b9a\u7535\u8bdd\u533a\u53f7', blank=True)),
                ('telephone', models.CharField(max_length=15, null=True, verbose_name='\u56fa\u5b9a\u7535\u8bdd\u53f7\u7801', blank=True)),
                ('extensionnumber', models.CharField(max_length=10, null=True, verbose_name='\u56fa\u5b9a\u7535\u8bdd\u5206\u673a\u53f7', blank=True)),
                ('file_path', models.CharField(max_length=100, null=True, verbose_name='\u8425\u4e1a\u6267\u7167\u5b58\u653e\u4f4d\u7f6e', blank=True)),
                ('saler', models.CharField(max_length=20, null=True, verbose_name='\u5ba2\u670d', blank=True)),
                ('note', models.CharField(max_length=100, null=True, verbose_name='\u5907\u6ce8', blank=True)),
                ('is_changed', models.BooleanField(default=False, verbose_name='\u7528\u6237\u662f\u5426\u4fee\u6539\u4fe1\u606f')),
                ('saler_reviewed', models.BooleanField(default=False, verbose_name='\u9500\u552e\u662f\u5426\u5ba1\u6838')),
                ('update', models.CharField(default=b'no', max_length=25, verbose_name='\u4e2a\u4eba\u5347\u7ea7\u4f01\u4e1a', choices=[(b'no', '\u672a\u7533\u8bf7\u5347\u7ea7'), (b'draft', '\u5ba2\u6237\u7533\u8bf7\u5347\u7ea7'), (b'done', '\u7533\u8bf7\u901a\u8fc7'), (b'fail', '\u7533\u8bf7\u4e0d\u901a\u8fc7')])),
                ('user', models.OneToOneField(related_name='userinfo', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': '\u7528\u6237\u6ce8\u518c\u4fe1\u606f',
            },
        ),
        migrations.AlterField(
            model_name='registercode',
            name='send_time',
            field=models.DateTimeField(auto_now=True),
        ),
    ]

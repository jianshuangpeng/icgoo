# coding=utf-8
from django.db import models


class WebConfig(models.Model):

    '''网站动态配置选项'''
    key = models.CharField(max_length=50, unique=True)
    value = models.CharField(max_length=500)
    pub_date = models.DateTimeField('date published')

    def __unicode__(self):
        return self.key

    def save(self, *args, **kwargs):
        super(WebConfig, self).save(*args, **kwargs)
        # 清缓存

    def delete(self, *args, **kwargs):
        return  # 禁止删除

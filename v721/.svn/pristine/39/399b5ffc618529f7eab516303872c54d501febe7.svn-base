# coding=utf-8
import datetime
import cPickle as pickle
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

from api.dc import getsingledata_from_dc


class ShoppingCart(models.Model):
    user = models.ForeignKey(User)
    creat_time = models.DateTimeField(auto_now_add=True)  # 创建时间
    modify_time = models.DateTimeField(auto_now=True)  # 用户手动修改时间,比如修改数量,删除等
    refresh_time = models.DateTimeField(auto_now_add=True)  # 数据刷新时间

    qty = models.IntegerField()  # 购买数量

    icg_partno = models.CharField(max_length=37, db_index=True)  # icgoo partno
    partno = models.CharField(max_length=50)  # 型号
    mfr = models.CharField(max_length=50)  # 制造商
    supplier = models.CharField(max_length=20)  # 供应商
    min_qty = models.IntegerField(blank=True)  # 最小起订量
    mult = models.IntegerField(blank=True)  # 倍数 和最小起定量影响前端增减按钮功能
    stock = models.IntegerField(default=0)  # 用户添加到购物车时候的库存
    stock_new = models.IntegerField(default=0)  # 刷新数据后的新库存数量

    price_calc = models.TextField(blank=True)
    price_calc_new = models.TextField(blank=True)

    PRICE_CHANGE_CHOICES = ((0, 'invariant'), (1, 'up'), (-1, 'down'),)
    price_change = models.IntegerField(default=0,
                                       choices=PRICE_CHANGE_CHOICES)  # 价格变动,前端使用

    # 过期--刷新数据,即根据icgpartno还能找到这个数据.
    # 失效--只能删除数据,根据icgpartno无法找到数据.
    STATUS_CHOICES = ((0, 'normal'),  # 正常 显示
                      (1, 'commit'),  # 已提交 不显示
                      (2, 'del'),  # 已删除 不显示
                      (3, 'disappear')  # 失效 显示 不过后续只能删除
                      )
    status = models.IntegerField(default=0, choices=STATUS_CHOICES)  # 状态
    can_refresh = models.BooleanField(default=True)  # 是否可以刷新,比如询价类就不能自动刷新
    other = models.TextField(blank=True)  # 保留字段,用于扩展

    def __unicode__(self):
        return "%s-%s" % (self.id, self.user.username)

    @property
    def is_available(self):
        # 有效true,过期false,过期才显示刷新按钮
        return self.refresh_time >= timezone.now() - datetime.timedelta(days=1)

    def unpack_price(self):
        # 把pickel后的价格转换回列表
        # 其实不return self当前对象的值也已经被改变了,可以直接在view中传递给templates,但需要使用propery装饰
        # 不过为了方便他人维护,这里依然return对象在view使用推导式获取新列表
        self.price_calc = pickle.loads(str(self.price_calc))
        if self.price_calc_new:
            self.price_calc_new = pickle.loads(str(self.price_calc_new))
        return self

    def add_data(self, userobj, partno, supplier, icg_partno, qty):
        newdata = getsingledata_from_dc(supplier, partno, icg_partno)
        if newdata:
            self.user = userobj
            self.qty = qty
            self.partno = partno
            self.supplier = supplier
            self.icg_partno = icg_partno
            self.mfr = newdata['mfr']
            self.min_qty = newdata['min_qty']
            self.mult = newdata['mult']
            self.stock = newdata['stock']
            newprice = pickle.dumps(newdata['price_calc'])
            self.price_calc = newprice
            self.save()
            return True
        else:
            return False

    def refresh_data(self):
        # 刷新数据,这里的行为由用户触发,用新数据替换老数据,而后台更新则不替换
        # 只需要更新status=1的数据
        newdata = getsingledata_from_dc(
            self.supplier, self.partno, self.icg_partno)
        if newdata:
            self.refresh_time = timezone.now()
            self.min_qty = newdata['min_qty']
            self.mult = newdata['mult']
            self.stock = self.stock_new = newdata['stock']
            newprice = pickle.dumps(newdata['price_calc'])
            self.price_calc_new = self.price_calc = newprice  # 注意这里刷新了新老数据
            self.price_change = 0  # 更新后价格变化为0
        else:
            # 数据失效
            self.status = 3
        self.save()

    def modify_qty(self, newqty):
        # 修改购买数量,只能由用户触发
        if newqty > 0:
            self.qty = newqty
            self.save()

    def commit_data(self):
        self.status = 1
        self.save()

    def delete_data(self):
        self.status = 2
        self.save()

#coding=utf-8
import json
import requests
import datetime
import re
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import HTMLParser
from django.contrib.auth.decorators import login_required
from api.jy import get_tracking_number
MONTH = (
    (u'一月',u'01'),
    (u'二月',u'02'),
    (u'三月',u'03'),
    (u'四月',u'04'),
    (u'五月',u'05'),
    (u'六月',u'06'),
    (u'七月',u'07'),
    (u'八月',u'08'),
    (u'九月',u'09'),
    (u'十月',u'10'),
    (u'十一月',u'11'),
    (u'十二月',u'12'),
)

month = dict(MONTH)
class MyHTMLParser1(HTMLParser.HTMLParser):
    def __init__(self):
        HTMLParser.HTMLParser.__init__(self)
        self.result = ''
        self.flag = False

    def handle_starttag(self, tag, attrs):
        if tag == 'input' and self.flag == False and attrs :
            if('name','HIDDEN_FIELD_SESSION') in attrs:
                for (key,value) in attrs:
                    if key == 'value' :
                        self.result = self.result + value
                        self.flag = True
        else:
            pass


class MyHTMLParser(HTMLParser.HTMLParser):
    def __init__(self):
        HTMLParser.HTMLParser.__init__(self)
        self.result = []#记录结果
        self.flag = False#标记

    def handle_starttag(self, tag, attrs):#起始标签
        if tag == 'td' and self.flag == False:
            self.flag = True
            # print 'start=',self.counter

        else:
            pass

    def handle_endtag(self, tag):#结束标签
        if tag == 'td' and self.flag == True:
            self.flag = False

    def handle_data(self, data):#数据处理
        if self.flag == True:
            self.result.append(data)



def filter_string(string):
    """
    除去字符串中的空格，换行等等.
    这个主要是给Ups用，它抓取的是HTML网页源代码，不是json数据包，源代码中很多空格，换行符等等，对正则表达式匹配有影响
    """
    s = ''
    for one in string:
        if one!='\n' and one!='\r' and one!='\t':
            s = s + one
    return s


def api_get_state_by_tracking_number(sale_order_line_id,partner_id):
    """
    根据销售子单，获取物流信息
    有的发货主单有多个运单号，但应该都是同一批的，可以只取其中一个运单号进行查询即可
    运单号是由两部分组成，一个是快递公司名称，一个是运单号

    """
    try:
        trackingnumber = get_tracking_number(sale_order_line_id,partner_id)
        if trackingnumber['tracking_number']:
            tracking_number = trackingnumber['tracking_number']#这里tracking_number是从数据库里获得的，但是数据库里但数据库里数据记录形式有很多种，在此对数据进行分割
            tracking_number = tracking_number.encode('utf-8')
            lists = re.split('，|_|:|;|；|,|：| ',tracking_number)#混合分割
            lists = sorted(lists,reverse=True)
            tracking_express = lists[0]#快递公司名
            if tracking_express == 'fedex':
                num = lists[1]#获取运单号
                post_data = "%7B%22TrackPackagesRequest%22%3A%7B%22appType%22%3A%22WTRK%22%2C%22uniqueKey%22%3A%22%22%2C%22processingParameters%22%3A%7B%7D%2C%22trackingInfoList%22%3A%5B%7B%22trackNumberInfo%22%3A%7B%22trackingNumber%22%3A%22" + num + "%22%2C%22trackingQualifier%22%3A%22%22%2C%22trackingCarrier%22%3A%22%22%7D%7D%5D%7D%7D&action=trackpackages&locale=zh_CN&version=1&format=json"
                headers = {'user-agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:46.0) Gecko/20100101 Firefox/46.0'}
                url = 'https://www.fedex.com/trackingCal/track' + '?data=' + post_data#获取`数据包的url
                return_data = requests.post(url,headers=headers)#fede官网上获取这些json数据的请求方式是post方式
                return_json =json.loads(return_data.text)#将数据包转换为json形式
                return return_json
            elif tracking_express =='dhl':
                num = lists[1]
                post_data = 'AWB=%s&countryCode=cn&languageCode=zh'%num
                headers = {'user-agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:46.0) Gecko/20100101 Firefox/46.0'}
                url = 'http://www.cn.dhl.com/shipmentTracking' + '?' + post_data
                return_data = requests.get(url,headers=headers)#dhl中文官网上获取这些json数据的请求方式是get方式
                return_json = json.loads(return_data.text)#将抓取的数据包转换为json形式
                return return_json
            elif tracking_express == 'ups':#r如果是ups,ups需要爬取两次
                num = lists[1]
                headers = {'user-agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:46.0) Gecko/20100101 Firefox/46.0'}
                url1 = 'https://wwwapps.ups.com/WebTracking/track?loc=zh_CN&trackNums=' + num + '%20&track.x=%E8%BF%BD%E8%B8%AA'
                return_data1 = requests.post(url1,headers=headers)#,timeout=1)
                myhtml1 = MyHTMLParser1()
                text1 = return_data1.text
                myhtml1.feed(text1)
                myhtml1.close()
                result1 = myhtml1.result
                result1 = str(result1)
                result1 = result1.replace('+','%2B').replace('/','%2F')
                if result1 != '':
                    post_data = 'loc=zh_CN&USER_HISTORY_LIST=&progressIsLoaded=N&refresh_sii=&showSpPkgProg1=true&datakey=line1&HIDDEN_FIELD_SESSION=' + result1 + '&multiship=true&descValue'
                    url = 'https://wwwapps.ups.com/WebTracking/detail?'+ post_data  + num + '=&trackNums=' + num
                    return_data = requests.post(url,headers=headers)#,timeout=1)
                    myhtml = MyHTMLParser()
                    text = return_data.text
                    text = filter_string(text)
                    myhtml.feed(text)
                    myhtml.close()
                    result = myhtml.result
                else:
                    result = []
            # 以下程序对数据进行处理将
                dict = {}
                lenght = len(result)
                if lenght != 0:
                    data = []
                    for i in xrange(0, lenght):
                        if i % 4 == 0:
                            data.append(dict)
                            dict = {}
                            dict['adress'] = result[i]#地点

                        if i % 4 == 1:
                            dict['date'] = result[i]#日期

                        if i % 4 == 2:

                            dict['local_time'] = result[i]#时间
                        if i % 4 == 3:

                           dict['treatmet'] = result[i]#处理步骤
                    return data
                else:
                    data = [{'error': "Tracking number is not acquired!"}]
                    return data
        else:
            data = [{'error': "Tracking number is not acquired!"}]
    # print 'data=', data
            return data
    except:
        result = [{'error':"Tracking number is not acquired!"}]
        return result
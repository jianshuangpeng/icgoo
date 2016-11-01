# coding=utf-8
'''
@Author：XingSongYan
@CreateDate： Thu Nov  5 18:06:18 HKT 2015
@FileName：
@Description：
'''
from fabric.api import *
from fabric.contrib.files import exists
from fabric.colors import green, red
env.hosts = [
    #'root@192.168.2.191',
    #'root@192.168.2.192',
    #'root@192.168.2.193',
    #'root@192.168.2.194',
    'root@192.168.2.202',
]
env.password = "asdasd"


#@task
#@parallel
def init():
    if exists('/var/www/'):
        print "/var/www exists"
    else:
        run('mkdir -p /var/www/')
    with cd('/var/www/'):
        #run('easy_install pip')
        #run('yum install vim -y')
        #run('yum install yum install psmisc  -y')
        #run('yum install python-pip -y')
        #run('yum install gcc -y')
        #run('yum install python-devel -y')
        #run('yum install mysql-devel -y')
        #run('yum install screen -y')
        #run('yum install subversion -y')
        #run('yum install epel-release -y')
        #run('yum install nginx -y')
        #run('chkconfig nginx on')
        #run('svn co svn://192.168.2.26/trunk/icgoo/v72 --username xingsongyan --password xsy123')
        #run('pip install -r v72/req.txt')
        #run('pip install uwsgi')
        #run('service nginx start')
        #run('service firewalld stop')
        #run('chkconfig firewalld off')
        #run('setenforce 0')
        run('getenforce')
        #run('echo "uwsgi /var/www/v72/icgoo/uwsgi.ini" >> /etc/rc.local')
        #run('echo "setenforce 0" >> /etc/rc.local')
        #run('chmod +x /etc/rc.d/rc.local')
        #run('service firewalld status')



def auth():
    for o in env.hosts:
        local("ssh-copy-id %s" % o)


#@task
#@parallel
def update():
    with cd('/var/www/v721/'):
        try:
            run('svn up --username xingsongyan --password xsy123')
            # 重启uwsgi服务　来完成最后的更新 下面两句执行失效　edit by daimingming on 2016-08-19 11:28
            #run('sudo killall -s INT uwsgi')
            #run('sudo /usr/bin/uwsgi /var/www/v721/icgoo/uwsgi.ini')

        except SystemExit as e:
            print(red(str(e)))  # 如果异常继续处理而不是终止程序，注意这个异常类型不是Exception
        finally:
            print "update"
            #run('sleep 3')
            #run('uwsgi /var/www/v72/icgoo/uwsgi.ini')


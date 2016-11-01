#!/bin/sh
python manage.py collectstatic --noinput
echo 'collect done'

#copy static file to media.icgoo.net (kongming)
scp -r v7static xingsongyan@192.168.2.163:/home/media/icgoov7media/


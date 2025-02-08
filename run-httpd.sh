#!/bin/bash

WORKDIR=/usr/local/src/freepbx

if [ ! -f /var/www/html/.installed ];
then
cd ${WORKDIR}
./start_asterisk start
sleep 5
./install --dbengine=${DBENGINE} --dbname=${DBNAME} --dbhost=${DBHOST} --dbport=${DBPORT} \
--cdrdbname=${CDRDBNAME} --dbuser=${DBUSER} --dbpass=${DBPASS} --user=${USER}  --group=${GROUP} \
--webroot=${WEBROOT} --astetcdir=${ASTETCDIR} --astmoddir=${ASTMODDIR} --astvarlibdir=${ASTVARLIBDIR} \
--astagidir=${ASTAGIDIR} --astspooldir=${ASTSPOOLDIR} --astrundir=${ASTRUNDIR} --astlogdir=${ASTLOGDIR} \
--ampbin=${AMPBIN} --ampsbin=${AMPSBIN} --ampcgibin=${AMPCGIBIN}  --ampplayback=${AMPPLAYBACK} -n
fwconsole ma installall
fwconsole reload
fwconsole restart
touch /var/www/html/.installed
mkdir /var/lib/asterisk/etc
cp /etc/freepbx.conf /var/lib/asterisk/etc/
chown -R asterisk:asterisk /var/lib/asterisk/etc
/usr/sbin/apachectl -DFOREGROUND
else
cd ${WORKDIR}
./start_asterisk start
ln -s /var/lib/asterisk/etc/freepbx.conf /etc/freepbx.conf
ln -s /var/lib/asterisk/bin/fwconsole /usr/sbin/fwconsole
fwconsole reload
fwconsole restart
/usr/sbin/apachectl -DFOREGROUND
fi
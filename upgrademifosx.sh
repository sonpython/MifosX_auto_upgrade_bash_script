#!/bin/bash
echo ===================== stop the tomcat7 server =====================
service tomcat7 restart
echo ===================== Download MifosX release $1 =====================
wget http://downloads.sourceforge.net/project/mifos/Mifos%20X/mifosplatform-$1.RELEASE.zip
echo ===================== unzip new release $1 =====================
unzip mifosplatform-$1.*
echo ===================== go to the new relead $1 folder =====================
cd mifosplatform-$1.*
echo ===================== remove old mifosng-provider =====================
rm -rf /var/lib/tomcat7/webapps/mifosng-provider.war /var/lib/tomcat7/webapps/mifosng-provider
echo ===================== copy new mifosng-provider $1 =====================
cp mifosng-provider.war /var/lib/tomcat7/webapps/
echo ===================== remove old MifosX web app =====================
rm -rf /var/lib/tomcat7/webapps/ROOT/*
echo ===================== copy new MifosX web app and api live page $1 =====================
cp -R apps/community-app/* /var/lib/tomcat7/webapps/ROOT/
cp -R api-docs/ /var/lib/tomcat7/webapps/ROOT/
echo ===================== restart the tomcat7 server =====================
service tomcat7 restart
echo ===================== finish =====================
echo ===================== Now will tail the log to see what happen =====================
tail -f /var/log/tomcat7/catalina.out

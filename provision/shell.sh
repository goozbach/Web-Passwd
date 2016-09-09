#!/bin/bash

yum -y install httpd mod_ssl perl-Test-Harness perl-Test-Simple perl-CGI-Application perl-Config-Tiny perl-Test-Pod perl-Test-Pod-Content perl-Test-Pod-Coverage 

chkconfig httpd on
service httpd start
ln -s /vagrant/provision/secret.conf /etc/httpd/conf.d/
#htpasswd -c /etc/httpd/registry.users goozbach
ln -s /vagrant/provision/mgmt/ /var/www/
ln -s /vagrant/provision/registry.groups /etc/httpd/
ln -s /vagrant/provision/registry.users /etc/httpd/
ln -s /vagrant/lib/Web/ /usr/local/share/perl5/

#!/bin/bash

yum -y install httpd mod_ssl perl-Test-Harness perl-Test-Simple perl-CGI-Application perl-Config-Tiny perl-Test-Pod perl-Test-Pod-Content perl-Test-Pod-Coverage 

chkconfig httpd on
service httpd start
ln -fs /vagrant/provision/secret.conf /etc/httpd/conf.d/
ln -fs /vagrant/provision/mgmt/ /var/www/
ln -fs /vagrant/provision/registry.groups /etc/httpd/
mkdir -p /usr/local/share/perl5
ln -fs /vagrant/lib/Web/ /usr/local/share/perl5/
touch /etc/httpd/registry.users
echo -n 'cangetin' | htpasswd -ic /etc/httpd/registry.users goozbach
httpd -S && service httpd restart


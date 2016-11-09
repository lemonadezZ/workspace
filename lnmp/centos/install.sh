#!/usr/bin/bash
yum  -y update
#
yum  -y install git  readline-devel pcre-devel openssl-devel gcc gmake
#安装php
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y install php70w php70w-cli php70w-common php70w-devel php70w-fpm \
php70w-gd php70w-imap   php70w-mbstring php70w-mcrypt php70w-mysqlnd \
php70w-opcache php70w-pdo php70w-pecl-imagick php70w-pecl-redis php70w-xml 
#安装composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === \
'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') \
{ echo 'Installer verified'; } else { echo 'Installer corrupt'; \
unlink('composer-setup.php'); } echo PHP_EOL;" 
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer -v
yum install -y wget
wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
tar -xvf openresty-1.11.2.1.tar.gz
yum install -y readline-devel pcre-devel openssl-devel gcc make
cd openresty-1.11.2.1
WORKDIR /var/www/project/openresty-1.11.2.1
./configure
make
make install
WORKDIR ${workspace} 
/usr/local/openresty/bin/resty -v
yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
yum install  -y Percona-Server-server-57

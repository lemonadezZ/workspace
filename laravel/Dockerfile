FROM centos
MAINTAINER Lemonadezz_laravel
ENV workspace /var/www/project
WORKDIR ${workspace} 
RUN  yum  -y update
#
RUN  yum  -y install git  readline-devel pcre-devel openssl-devel gcc gmake
#安装php
RUN  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN  rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install php70w php70w-cli php70w-common php70w-devel php70w-fpm \
php70w-gd php70w-imap   php70w-mbstring php70w-mcrypt php70w-mysqlnd \
php70w-opcache php70w-pdo php70w-pecl-imagick php70w-pecl-redis php70w-xml 
#安装composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === \
'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') \
{ echo 'Installer verified'; } else { echo 'Installer corrupt'; \
unlink('composer-setup.php'); } echo PHP_EOL;" 
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN composer -v

RUN yum install -y wget
RUN wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
RUN tar -xvf openresty-1.11.2.1.tar.gz
RUN yum install -y readline-devel pcre-devel openssl-devel gcc make
RUN cd openresty-1.11.2.1
WORKDIR /var/www/project/openresty-1.11.2.1
RUN ./configure
RUN make
RUN make install
WORKDIR ${workspace} 
RUN /usr/local/openresty/bin/resty -v
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
RUN yum install  -y Percona-Server-server-57
EXPOSE 80 3306
#安装 mysql
#安装 nginx
#启动 php-fpm  mysql nginx  命令
ENTRYPOINT ['start.sh']

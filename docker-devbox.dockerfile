FROM amazonlinux:2

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html

RUN yum update -y

RUN amazon-linux-extras enable php7.4

RUN amazon-linux-extras install -y nginx1 php7.4

RUN yum install -y \
sudo \
gcc \
libmemcached-devel \
openssl-devel \
nano \
man \
vim \
sudo \
&& yum clean all

RUN yum install -y php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap,pecl-redis,pecl-memcached} \
&& yum clean all

COPY ./docker-nginx.conf /etc/nginx/nginx.conf

# add ec2-user
RUN useradd -m ec2-user
RUN usermod -aG wheel ec2-user
RUN sed -i "s|# %wheel	ALL=(ALL)	NOPASSWD: ALL|%wheel	ALL=(ALL)	NOPASSWD: ALL|g" /etc/sudoers

ENTRYPOINT /usr/sbin/php-fpm && /usr/sbin/nginx -g "daemon off;"

EXPOSE 80
EXPOSE 443
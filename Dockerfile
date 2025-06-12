FROM centos:7
MAINTAINER harsh@amarinfotech.com

RUN yum install -y httpd zip unzip && \
    yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/

WORKDIR /var/www/html

RUN unzip kindle.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf __MACOSX markups-kindle kindle.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80


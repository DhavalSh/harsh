FROM ubuntu:20.04
MAINTAINER harsh@amarinfotech.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y tzdata apache2 zip unzip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download GitHub zip (you can rename it while downloading)
ADD https://codeload.github.com/themewagon/Crypgo/zip/refs/tags/v1.0.0 /var/www/html/Crypgo-1.0.0.zip.zip

WORKDIR /var/www/html

RUN unzip Crypgo-1.0.0.zip.zip && \
    cp -rvf Crypgo-1.0.0/* . && \
    rm -rf Crypgo-1.0.0.zip Crypgo-1.0.0

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

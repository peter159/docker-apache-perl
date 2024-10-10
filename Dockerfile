# FROM ubuntu:16.04
FROM ubuntu:24.10

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        apt-utils \
        ssl-cert \
        apache2 \
        apache2-utils \
        apache2-dev \
        libapache2-mod-perl2 \
        libapache2-mod-perl2-dev \
        libcgi-pm-perl \
        liblocal-lib-perl \
        cpanminus \
        libexpat1-dev \
        libssl-dev \
        mysql-client \
        libmysqlclient-dev \
        libapreq2-dev \
        zip

RUN cpanm DBD::mysql && \
    cpanm JSON::PP && \
    cpanm DateTime && \
    a2enmod cgid && \
    a2enmod rewrite && \
    a2dissite 000-default && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y clean

# 在 apache2.conf 中设置环境变量
RUN echo 'SetEnv MaxDiffDesignerBaseUrl https://maxdiffdesigner.sawtoothsoftware.com' >> /etc/apache2/apache2.conf

COPY localhost.conf /etc/apache2/sites-enabled/localhost.conf

VOLUME ["/var/www/html"]

EXPOSE 80

# =============================================================================
# based on experience coming from cetres/centos-apache-php
#
# CentOS-7, Apache 2.4, PHP 7.2
#
# =============================================================================

FROM centos:7
LABEL maintainer="Luca Mastrobuono <lucamastrobuono1972@gmail.com>"

RUN yum -y update && \
    yum -y install \
        epel-release \
        httpd \
	wget \
        unzip

# -----------------------------------------------------------------------------
# Apache 2.4 + (PHP 7.2 from Remi)
# -----------------------------------------------------------------------------
RUN wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm; \
    yum -y localinstall remi-release-7.rpm && \
    yum-config-manager --enable remi-php72 && \
    yum -y install \
        php72-php \
        php72-php-common \
        php72-php-devel \
        php72-php-mysqlnd \
	php72-php-mbstring \
	php72-php-soap \
	php72-php-gd \
        php72-php-ldap \
        php72-php-pear \
        php72-php-pdo \
	php72-php-intl \
	php72-php-opcache \
	php72-php-xml \
        php72-php-pear \
        libaio && \
    sed -i 's/;error_log = syslog/error_log = \/var\/log\/httpd\/php_error.log/' /etc/opt/remi/php72/php.ini && \
    ln -sf /usr/bin/php72-pear /usr/bin/pear && \
    ln -sf /opt/remi/php72/root/usr/share/php /usr/share/php && \
    chmod -R g+w /opt/remi/php72/root/usr/share/php && \
    ln -sf /var/opt/remi/php72/lib/php /var/lib/php && \
    chmod -R g+w /var/www/html && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    rm -f /etc/httpd/conf.d/{userdir.conf,welcome.conf} && \
    sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# -----------------------------------------------------------------------------
# Set ports and env variable HOME
# -----------------------------------------------------------------------------
EXPOSE 80
#ENV HOME /var/www

# -----------------------------------------------------------------------------
# Start
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]

FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;\
yum -y install epel-release wget deltarpm;\
wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm;\
yum -y localinstall remi-release-7.rpm;\
yum-config-manager --enable remi-php72;\
yum -y update;\
yum -y install httpd php php-mbstring php-opcache php-gd php-xml php-pear php-fpm php-mysql MariaDB-client;\
systemctl enable httpd;\
/usr/sbin/httpd -k start
EXPOSE 80
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init" ]

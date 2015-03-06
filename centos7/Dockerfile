FROM centos
MAINTAINER highbird  <shunzhiyu@gmail.com>

# Configure my repo to use my custom Nginx with modsec
ADD webapps/index.html /opt/webapps/nginx/
ADD webapps/index.php /opt/webapps/php/
ADD conf/nginx/nginx.conf /opt/conf/nginx/
ADD scripts/nginx/restart.sh /opt/scripts/nginx/
ADD conf/supervisor/supervisord.conf /etc/
ADD sbin/telnet /usr/bin/
ADD sbin/ifconfig /usr/sbin/
ADD conf/ssh/authorized_keys /root/.ssh/ 

# install deps
RUN useradd app
RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx
RUN yum -y install openssh-server openssh-clients
RUN yum -y install php php-fpm php-gd php-mysql

RUN mkdir /opt/logs/nginx -p
RUN mkdir /opt/logs/supervisor -p
RUN mkdir /opt/scripts/nginx -p
RUN mkdir /opt/conf/nginx -p
RUN mkdir /opt/conf/supervisor -p
RUN mkdir /opt/webapps/nginx -p
RUN mkdir /opt/webapps/php -p
RUN cp /etc/nginx/mime.types /opt/conf/nginx/
RUN cp /etc/nginx/fastcgi_params /opt/conf/nginx/
RUN chown app:app /opt/logs/nginx
RUN chown app:app /opt/logs/supervisor
RUN chown app:app /opt/scripts/nginx
RUN chown app:app /opt/conf/nginx
RUN chown app:app /opt/conf/supervisor
RUN chown app:app /opt/webapps/nginx
RUN chown app:app /opt/webapps/php

RUN chmod a+x /opt/scripts/nginx/restart.sh
RUN echo "alias ll='ls -l'" >> /etc/bashrc
#RUN echo "/opt/scripts/nginx/restart.sh" >> /etc/bash.bashrc
#RUN echo "/usr/sbin/sshd" >> /etc/bash.bashrc
#RUN echo "alias ll='ls -l'" >> /etc/bash.bashrc
#RUN chmod a+x /etc/bash.bashrc

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN sed -i 's/UsePAM no/#UsePAM no/g' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# expose HTTP
EXPOSE 80

# Run
#CMD /bin/bash
CMD ["/usr/bin/supervisord","-n"]
#ENTRYPOINT ["/usr/bin/supervisord","-n"]
#ENTRYPOINT ["/bin/bash"]

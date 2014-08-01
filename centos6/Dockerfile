FROM centos:centos6
MAINTAINER highbird  <shunzhiyu@gmail.com>

# Configure my repo to use my custom Nginx with modsec
ADD http://static.theroux.ca/repository/failshell.repo /etc/yum.repos.d/
ADD index.html /opt/webapps/nginx/
ADD index.php /opt/webapps/php/
ADD nginx.conf /opt/conf/nginx/
ADD supervisord.conf /etc/

# install deps
RUN useradd app
RUN yum -y install python-setuptools
RUN easy_install supervisor
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

#RUN chmod a+x /opt/scripts/nginx/restart.sh
#RUN echo "alias ll='ls -l'" >> /etc/bashrc
#RUN echo "/opt/scripts/nginx/restart.sh" >> /etc/bash.bashrc
#RUN echo "/usr/sbin/sshd" >> /etc/bash.bashrc
#RUN echo "alias ll='ls -l'" >> /etc/bash.bashrc
#RUN chmod a+x /etc/bash.bashrc

# expose HTTP
#EXPOSE 80

# Run
#CMD /bin/bash
ENTRYPOINT ["/usr/bin/supervisord","-n"]
#ENTRYPOINT ["/bin/bash"]

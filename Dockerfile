FROM centos:6

MAINTAINER William GARCIA <garcia.rodriguez.william@gmail.com>

RUN yum -y update && yum -y install xz rpm-build yum-utils wget tar gcc ncurses-devel

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root
VOLUME /root

ENTRYPOINT [ "/entrypoint.sh" ]

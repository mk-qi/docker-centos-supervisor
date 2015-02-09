#
# fanli:base7
#

FROM centos:centos7
MAINTAINER it@fanli.com

RUN yum -y install epel-release; yum clean all
RUN yum -y install supervisor yum clean all;

RUN \
  yum install -y epel-release && \
  yum install -y python-setuptools hostname inotify-tools && \
  yum install -y net-tools  && \
  yum clean all && \

  easy_install supervisor


# copy cfg files:
ADD ./cfg/supervisord.conf /etc/supervisord.conf
ADD ./cfg/supervisord.d /etc/supervisord.d
ADD ./bootstrap.sh /usr/local/bin/bootstrap.sh

# start services:
ENTRYPOINT ["/usr/local/bin/bootstrap.sh"]


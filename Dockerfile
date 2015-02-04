FROM ubuntu:14.04.1
MAINTAINER sampot <sam@eavatar.com>

ADD ./build.sh /tmp/build.sh
#RUN chmod a+x /tmp/build.sh
RUN DEBIAN_FRONTEND=noninteractive /tmp/build.sh

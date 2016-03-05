
# Builds a docker gui image
FROM ubuntu

MAINTAINER aptalca

#########################################
##        ENVIRONMENTAL CONFIG         ##
########################################
RUN \
#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################
echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list && \
echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list && \

# Install packages needed for app
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
apt-get update && \
apt-get install -y ImageMagick && \
apt-get install tmux git fish -y

#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app
RUN git clone https://github.com/XX-net/XX-Net.git /opt/xx-net;mkdir -p /etc/my_init.d
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Place whater volumes and ports you want exposed here:
VOLUME ["/config"]
EXPOSE 8085 8087

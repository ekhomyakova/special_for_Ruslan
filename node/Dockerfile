FROM node:0.10.37

RUN  echo "deb http://ftp.cz.debian.org/debian/ jessie main\n" > /etc/apt/sources.list \
  && echo "deb http://ftp.cz.debian.org/debian/ jessie-updates main\n" >> /etc/apt/sources.list \
  && echo "deb http://security.debian.org jessie/updates main\n" >> /etc/apt/sources.list

ARG TZ
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#==============
# VNC and Xvfb
#==============
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    bzip2 \
    libgtk-3-dev \
    ssh \
    sshpass \
    openjdk-7-jre \
    ca-certificates \
    unzip \
    xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && apt-get -y autoremove

RUN cd /usr/local && \
    wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 && \
    tar xjf firefox-46.0.1.tar.bz2 && \
    ln -s /usr/local/firefox/firefox /usr/bin/firefox

RUN apt-get -qqy --no-install-recommends install xauth
#ARG FIREFOX_VERSION
#RUN apt-get update -qqy \
#  && apt-get -qqy --no-install-recommends install firefox \
#  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
#  && wget --no-verbose -O /tmp/firefox.tar.bz2 http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 \
#  && apt-get -y purge firefox \
#  && rm -rf /opt/firefox \
#  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
#  && rm /tmp/firefox.tar.bz2 \
#  && mv /opt/firefox /opt/firefox-46 \
#  && ln -fs /opt/firefox-46/firefox /usr/bin/firefox


RUN npm install -g gulp

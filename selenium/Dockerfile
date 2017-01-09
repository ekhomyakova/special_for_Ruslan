# NOTE: DO *NOT* EDIT THIS FILE.  IT IS GENERATED.
# PLEASE UPDATE Dockerfile.txt INSTEAD OF THIS FILE
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM selenium/node-firefox:3.0.1-dysprosium

USER root

#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://cz.archive.ubuntu.com/ubuntu xenial main universe\n" > /etc/apt/sources.list \
  && echo "deb http://cz.archive.ubuntu.com/ubuntu xenial-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://cz.archive.ubuntu.com/ubuntu xenial-security main universe\n" >> /etc/apt/sources.list

RUN apt-get update -qqy \
  && apt-get install --yes \
    apt-transport-https \
    sshpass \
    git \
    ssh  \
    wget \
    curl

RUN echo "deb https://deb.nodesource.com/node_0.12 xenial main" > /etc/apt/sources.list.d/nodesource.list \
  && curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && apt-get update -qqy \
  && apt-get install --yes \
    nodejs \
    npm \
  && ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g gulp

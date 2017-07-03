
# Base the image on a stable branch of Node.js
FROM hypriot/rpi-node:6.10.0-slim

MAINTAINER Florian Chauveau

# Install Domoticz from sources.
# Install node red
RUN npm install -g --unsafe-perm node-red

# Set up
RUN mkdir -p /node-red/user-dir
COPY start-node-red.sh /node-red
RUN chmod u+x /node-red/start-node-red.sh
COPY settings.js /node-red/

RUN \
  apt-get update && \
  apt-get install -y apt-utils build-essential libudev-dev && \
  apt-get install -y make wget net-tools python   && \
  apt-get install -y iputils-ping libudev0
RUN \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/openzwave_1.4.79.gfaea7dd_armhf.deb"  && \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/libopenzwave1.3_1.4.79.gfaea7dd_armhf.deb"  && \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/libopenzwave1.3-dev_1.4.79.gfaea7dd_armhf.deb"  && \
  sudo dpkg -i *openzwave*.deb && \
  cd /node-red/user-dir  && \
  npm install openzwave-shared  && \
  npm install node-red-contrib-openzwave && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean && \
  apt-get autoclean && \
  npm cache clean && \
  rm /*openzwave*.deb
# VOLUME /node-red/user-dir
EXPOSE 1880

CMD /node-red/start-node-red.sh

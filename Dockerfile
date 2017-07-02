
# Base the image on a stable branch of Node.js
FROM hypriot/rpi-node:6.10.0-slim


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
  apt-get install -y cmake apt-utils build-essential libudev-dev && \
  apt-get install -y make wget net-tools python libsqlite3-dev subversion curl libcurl4-openssl-dev libusb-dev zlib1g-dev && \
  apt-get install -y iputils-ping libudev0 && \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/openzwave_1.4.79.gfaea7dd_armhf.deb" -O /tmp/ && \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/libopenzwave1.3_1.4.79.gfaea7dd_armhf.deb" -O /tmp/ && \
  wget "https://github.com/ekarak/openzwave-debs-raspbian/raw/master/v1.4.79/libopenzwave1.3-dev_1.4.79.gfaea7dd_armhf.deb" -O /tmp/ && \
  sudo dpkg -i /tmp/*openzwave*.deb && \
  cd /node-red/user-dir  && \
  npm install openzwave-shared  && \
  apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# VOLUME /node-red/user-dir
EXPOSE 1880

# crusaider/rpi-node-red
Docker image combatible with Rasbian PI runnig Node-RED in a docker container on your PI.
## Content
The image contains a default installation of Node-RED v0.13.4 running on top of Node.js v4.4.3. The base of the image is `hypriot/rpi-node:4.4.3-wheezy`.
## Configuration
The image contains a `/node-red` directory where the default `setting.js` file is placed. The `user-dir` is located in `/node-red/user-dir`.

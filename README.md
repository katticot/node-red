# crusaider/rpi-node-red
Docker image combatible with Rasbian PI runnig Node-RED in a docker container on your PI.
## Content
The image contains a default installation of Node-RED v0.13.4 running on top of Node.js v4.4.3. The base of the image is `hypriot/rpi-node:4.4.3-wheezy`.
## Configuration
The image contains a `/node-red` directory where the default `setting.js` file is placed. The `user-dir` is located in `/node-red/user-dir`. Any flows you create will be stored in `/node-red/user-dir/flows.js`
## Running
You can start the image with the following command on you Raspbian PI:
`docker run -d -v /home/pi/node-red-user-dir:/node-red/user-dir -p 1880:1880 --restart=unless-stopped --name=node-red crusaider/rpi-node-red `
This will start a container named `node-red` running in the backround. The container will start when the Docker daemon starts (i.e. when your PI boots up). The directory `/home/home/pi/node-red-user-dir` will be mounted on the container and the `flows.js` will be saved in that directory.

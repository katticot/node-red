# sag911/rpi-node-red
Docker image for Node-red with crusaider customizations
## Content
The image contains a default installation of Node-RED . The base of the image is [node-red/node-red-docker](https://github.com/node-red/node-red-docker).
## Configuration
The image contains a `/node-red` directory where the default `setting.js` file is placed. The `user-dir` is located in `/node-red/user-dir`. Any flows you create will be stored in `/node-red/user-dir/flows.js`
## Running
You can start the image with the following command :
```
$ docker run -d -v /home/pi/node-red-user-dir:/node-red/user-dir -p 1880:1880 --restart=unless-stopped --name=node-red sag911/node-red
```
This will start a container named `node-red` running in the backround. The container will start when the Docker daemon starts (i.e. when your PI boots up). The directory `/home/home/pi/node-red-user-dir` will be mounted on the container and the `flows.js` will be saved in that directory.
## Source
[Source Repository](https://github.com/katticot/node-red/)

[Docker Hub](https://hub.docker.com/r/crusaider/rpi-node-red/)
## License

The MIT License (MIT)

Copyright (c) 2017 Keita  ATTICOT

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

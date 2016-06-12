# Docker containers with VNC GUI and Chinese  environment!
The repository contains a collection of Docker images with headless VNC environments.

Each docker image is installed with the following components:

* Desktop environment [**Xfce4**](http://www.xfce.org)
* VNC-Server (default VNC port `5901`)
* Chinese environment
* LibreOffice
* Browsers:
  * Mozilla Firefox

### Current provided OS & UI sessions:
* __Centos7 with `Xfce4` UI session:__

  Run command with mapping to local port `5911`:

      docker run -d -p 5911:5901 wjw465150/centos-xfce-vnc

  => connect via __VNC viewer `localhost:5901`__, default password: `vncpassword`

### Hints
#### override the VNC password
Simple override the value of the environment variable `VNC_PW`. For example in
the docker run command:

    docker run -it -p 5911:5901 -e "VNC_PW=my-new-password" consol/centos-xfce-vnc

### Contact
For questions or maybe some hints, feel free to contact us via **[wjw465150@gmail.com](mailto:wjw465150@gmail.com)**

### install lastest firefox
+ download lastest firefox for linux 64`http://download.firefox.com.cn/releases/firefox/47.0/zh-CN/Firefox-latest-x86_64.tar.bz2`  
+ uncompress`tar xvf ./Firefox-lastest-x86_64.tar.bz2`  
+ replace all files in `/usr/lib64/firefox`  

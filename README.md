# jenkins-docker
本 Dockerfile 基於官方 jenkins/jenkins:latest image

```bash
git clone https://github.com/ThanatosDi/jenkins-docker
cd jenkins-docker
docker build -t thanatosdi/jenkins:1.0 .
```
在 Host 建立一個資料夾保存 Docker(jenkins) 的資料  
```bash
mkdir /var/jenkins_home
sudo chmod 777 /var/jenkins_home
```
利用本 image 建立 container  
```bash
docker run -itd --name jenkins --privileged=true -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock thanatosdi/jenkins:1.0
```

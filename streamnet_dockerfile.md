# StreamNet中服务容器化总结 #

## iota service ##

```
1.build image
git clone https://github.com/triasteam/StreamNet.git
cd StreamNet/
docker build -t ${NAME}:${TAG} .

2.start container
sudo docker run -d -p 14700:14700 -p 13700:13700 --name ${NAME} -v ${SCRIPTPATH}/data:/iri/data  ${NAME}:${TAG} /entrypoint.sh

```  
## go client service ##
```
1.build image
cd StreamNet/scripts/front_end
sudo docker build -t ${NAME}:${TAG}  -f  go_docker/Dockerfile .

2.start container
sudo  docker run -itd -p 8000:8000 -e "HOST_IP=$IP" --name  ${NAME}  ${NAME}:${TAG}
```  
## Leviatom web service ##
```
1.build image
cd StreamNet/scripts/front_end
sudo docker build -t ${OAUTH_NAME}:${TAG} --build-arg HOST_IP=$1 .

2.start container
sudo docker run -itd -p 80:80 -p 8000:8000  --name ${OAUTH_NAME} ${OAUTH_NAME}:${TAG}
```  

## mysql service ##
```
1.build image
cd StreamNet/scripts/front_end/trias-oauth/
sudo docker build -t ${MYSQL_NAME}:${TAG} -f mysql_docker/Dockerfile .

2.start container
sudo docker run -itd -p 3306:3306 --name ${MYSQL_NAME} ${MYSQL_NAME}:${TAG}
```  

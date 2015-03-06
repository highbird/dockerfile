docker stop ysz_centos6
docker rm ysz_centos6
#docker  run -t -i -d  --name ysz_centos6 highbird/centos6 /bin/bash 
docker  run -t -i -d  --name ysz_centos6 -p 8000:80 highbird/centos6 
docker ps -a


docker stop $(docker ps -a -q)
git clone https://github.com/CentOS/CentOS-Dockerfiles.git
cd CentOS-Dockerfiles/httpd/centos7
docker build --rm -t manghula/httpd .
 

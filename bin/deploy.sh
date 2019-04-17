application_name=hello-world-war

if [[ $(docker ps -a | grep $application_name | awk '{ print $1 }') ]]; then
    docker stop $(docker ps -a | grep $application_name | awk '{ print $1 }')
	docker rm $(docker ps -a | grep $application_name | awk '{ print $1 }')
else
fi
docker run -dit --rm -p 80:8080 --name $application_name tomcat
docker cp hello-world-war-*.war $(docker ps -a | grep $application_name | awk '{ print $1 }'):/usr/local/tomcat/webapps/.
docker logs --tail=100 $(docker ps -a | grep $application_name | awk '{ print $1 }')
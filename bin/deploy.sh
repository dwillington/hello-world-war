application_name=hello-world-war

if [[ $(docker ps -a | grep $application_name | awk '{ print $1 }') ]]; then
    echo "$application_name container already exists, update application"
else
    echo "$application_name container does not exist, create container, add application"
	docker run -dit --rm -p 80:8080 --name $application_name tomcat
fi
docker cp hello-world-war-*.war $(docker ps -a | grep $application_name | awk '{ print $1 }'):/usr/local/tomcat/webapps/.
docker logs --tail=100 $(docker ps -a | grep $application_name | awk '{ print $1 }')
application_name=hello-world-war

if [[ $(docker ps -a | grep $application_name | awk '{ print $1 }') ]]; then
    echo "$application_name exists"
    docker stop $(docker ps -a | grep $application_name | awk '{ print $1 }')
else
    echo "$application_name container does not exist"
fi
docker run -dit --rm -p 80:8080 --name $application_name tomcat
sleep 1
docker cp $application_name/hello-world-war-*.war $(docker ps -a | grep $application_name | awk '{ print $1 }'):/usr/local/tomcat/webapps/hello-world-war.war
docker logs --tail=100 $(docker ps -a | grep $application_name | awk '{ print $1 }')
#application_name=hello-world-war && docker exec -it $(docker ps -a | grep $application_name | awk '{ print $1 }') bash

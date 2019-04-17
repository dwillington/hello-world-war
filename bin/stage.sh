application_name=hello-world-war
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c --command="rm -rf $application_name && mkdir -p $application_name"
gcloud compute scp --zone us-east4-c bin/deploy.sh target/hello-world-war-*.war amjada@docker-host-1:~/$application_name/.
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c --command="./$application_name/deploy.sh"
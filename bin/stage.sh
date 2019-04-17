stage_folder=stage-hello-world-war
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c rm -rf $stage_folder && mkdir -p $stage_folder
gcloud compute scp deploy.sh target/hello-world-war-*.war amjada@docker-host-1:~/$stage_folder/. --zone us-east4-c
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c ./$stage_folder/deploy.sh
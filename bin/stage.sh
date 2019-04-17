stage_folder=stage-hello-world-war
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c --command="rm -rf $stage_folder && mkdir -p $stage_folder"
gcloud compute scp --zone us-east4-c bin/deploy.sh target/hello-world-war-*.war amjada@docker-host-1:~/$stage_folder/.
gcloud compute ssh amjada@docker-host-1 --zone us-east4-c --command="./$stage_folder/deploy.sh"
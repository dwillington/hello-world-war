# amjada



req           | verified by developer?
------------- | -------------
web and api accessible publicly  | curl 34.117.57.219/<br />curl 34.117.57.219/api/status
database private  | <p align="center"><img src="images/db_private.JPG" width="600" /></p>
resources for all tiers: cloud-sql and GKE   | <p align="center"><img src="images/verified.png" width="100" /></p>
IoC provisioning: [ansible_scripts](ansible_scripts) | <p align="center"><img src="images/verified.png" width="100" /></p>
server instance failures | <p align="center"><img src="images/pod_failure.JPG" width="600" /></p>
update without downtime: liveness, readiness probes, rolling updates | <p align="center"><img src="images/verified.png" width="100" /></p>
automated deployment: google cloudbuild.yaml [node-3tier-app2](node-3tier-app2) | <p align="center"><img src="images/cloudbuild.JPG" width="400" /></p>
database backups: | <img src="images/db_backup_config.JPG" width="400" />
log retention: | <img src="images/gke_logging.JPG" width="400" />
repository: [node-3tier-app2](node-3tier-app2) | <p align="center"><img src="images/verified.png" width="100" /></p>
Google Cloud was chosen due to existing account | <p align="center"><img src="images/verified.png" width="100" /></p>

---
#### standard kubernetes deployment service ingress
<img src="images/kubernetes_architecture.JPG"/>


#### liveness and readiness probes
<img src="images/live_and_ready.JPG"/>


#### pod failure recovery
<img src="images/pod_failure.JPG"/>


#### api -> cloudsql-proxy -> Private Network -> cloudsql
<img src="images/cloudsql_proxy_sidecar_vpc.JPG"/>


#### api -> Dev Architecture
<img src="images/dev_architecture.JPG"/>

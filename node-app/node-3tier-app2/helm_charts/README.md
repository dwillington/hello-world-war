# helm_charts

#### here we can requests being "rotated" over the app2-api pods
<img src="images/rotating_pods.JPG" width="600"/>

#### describe ingress output
<img src="images/describe_ingress.JPG" width="600"/>

#### finally, some success
<img src="images/success.JPG" width="600"/>

#### Commands to remember...
```


################################################################################
# HELM DEPLOYMENT
################################################################################
cd /home/amjada/amjada/node-3tier-app2/helm_charts
# helm -n app2 delete app2-ingress
# helm -n app2 install -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-ingress/values.yaml app2-ingress /home/amjada/amjada/node-3tier-app2/helm_charts/app2-ingress/
helm -n app2 upgrade -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-ingress/values.yaml app2-ingress /home/amjada/amjada/node-3tier-app2/helm_charts/app2-ingress/ --force

helm -n app2 delete app2-api
helm -n app2 install -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-api/values.yaml app2-api /home/amjada/amjada/node-3tier-app2/helm_charts/app2-api/
helm -n app2 upgrade -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-api/values.yaml app2-api /home/amjada/amjada/node-3tier-app2/helm_charts/app2-api/

helm -n app2 delete app2-web
helm -n app2 install -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-web/values.yaml app2-web /home/amjada/amjada/node-3tier-app2/helm_charts/app2-web/
helm -n app2 upgrade -f /home/amjada/amjada/node-3tier-app2/helm_charts/app2-web/values.yaml app2-web /home/amjada/amjada/node-3tier-app2/helm_charts/app2-web/



--set image.tag=fe67557
--set image.tag=5b111f0
kubectl -n app2 get pod
kubectl -n app2 describe pod app2-web-756bd4cccf-zfqlt
kubectl -n app2 get service
kubectl -n app2 describe service
kubectl -n app2 get ingress
kubectl -n app2 describe ingress

### DEBUG
kubectl -n app2 logs app2-api-7dbb85fff-btgfg
kubectl -n app2 exec -it xxx   -- bash
kubectl -n app2 delete pods xxx

### VERIFY
# <!DOCTYPE html><html><head><title>3tier App</title><link rel="stylesheet" href="/stylesheets/style.css"></head><body><h1>3tier App</h1><p>Welcome!, it's 2022-10-25T21:59:55.094Z</p><p><img src="/images/nyan.gif" title="nyan cat"></p><pre>app2-api-7dbb85fff-nmv98</pre></body></html>
#!/bin/bash
while :
do
  curl 34.117.57.219/api/status
  echo ""
  web=$(curl -s 34.117.57.219/)
  arrIN=(${web//\<p/ })
  if [[ ${arrIN[6]} == *"Error"* ]]; then
    echo "${arrIN[6]} ####################################################"
  else
    echo ${arrIN[6]}
  fi
  echo ""
	sleep 1
done


################################################################################
# SETUP
################################################################################
#https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl
gcloud components install kubectl
gke-gcloud-auth-plugin --version
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
gcloud container clusters get-credentials gke-poptal --zone=northamerica-northeast2-a
kubectl create namespace app2
#--zone=northamerica-northeast2
#--region=northamerica-northeast2-a
kubectl create namespace app2

# kubectl -n app2 delete serviceaccount sa-app2

 # HANDLED IN ansible_scripts
# gcloud compute addresses create web-static-ip --global
# gcloud compute addresses create web-static-ip --project silicon-pointer-146802 --region=northamerica-northeast2
# gcloud compute addresses delete web-static-ip --project silicon-pointer-146802 --region=northamerica-northeast2
```

#### Helpful links...

```
Readiness Probe
Readiness probes determine whether or not a container is ready to serve requests. If the readiness probe returns a failed state, then Kubernetes removes the IP address for the container from the endpoints of all Services.

Developers use readiness probes to instruct Kubernetes that a running container should not receive any traffic. This is useful when waiting for an application to perform time-consuming initial tasks, such as establishing network connections, loading files, and warming caches.

Liveness Probe
Liveness probes determine whether or not an application running in a container is in a healthy state. If the liveness probe detects an unhealthy state, then Kubernetes kills the container and tries to redeploy it.

```
https://www.digitalocean.com/community/tutorials/architecting-applications-for-kubernetes#implementing-readiness-and-liveness-probes<br />

Best Practices<br />
https://codefresh.io/docs/docs/new-helm/helm-best-practices/#chart-versions-and-appversions<br />
ingress example<br />
https://cloud.google.com/kubernetes-engine/docs/how-to/load-balance-ingress#create-ingress<br />
multiple ingresses/paths<br />
https://www.reddit.com/r/kubernetes/comments/pt0q41/helm_ingress_template_for_multiple_ingressespaths/<br />
invalid ingress spec: service xxx is type "ClusterIP", expected "NodePort" or "LoadBalancer"
https://stackoverflow.com/questions/51572249/why-does-google-cloud-show-an-error-when-using-clusterip<br />
If you don't specify a default backend, GKE provides a default backend that returns 404. This is created as a default-http-backend<br />
https://cloud.google.com/kubernetes-engine/docs/concepts/ingress<br />

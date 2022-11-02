# node-3tier-app2

#### Commands to remember...
```
################################################################################
# DOCKER DEPLOYMENTS FOR TESTING
################################################################################
cd /home/amjada/amjada/node-3tier-app2/web/
docker build -t northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-web .
docker image push northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-web
docker run --name app2-web -p 3010:3000 -d \
  -e PORT='3000' \
  -e API_HOST='http://172.17.0.1:3000' \
  northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-web
docker logs app2-web
docker stop app2-web;docker rm app2-web
curl http://localhost:3010

cd /home/amjada/amjada/node-3tier-app2/api/
docker build -t northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-api .
docker image push northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-api
docker stop app2-api;docker rm app2-api
docker rm $(docker ps -a -f status=exited -q)
docker run --name app2-api -p 3000:3000 -d \
  -e PORT='3000' \
  -e DB='postgres' \
  -e DBUSER='postgres' \
  -e DBPASS='xxx' \
  -e DBHOST='34.130.94.8' \
  -e DBPORT='5432' \
  northamerica-northeast2-docker.pkg.dev/silicon-pointer-146802/poptal-docker/app2-api
docker logs app2-api
docker exec -it app2-api bash
curl http://localhost:3000/api/status

```

#### Helpful links...
practices for speeding up builds<br />
https://cloud.google.com/build/docs/optimize-builds/speeding-up-builds/<br />
$SHORT_SHA : the first seven characters of COMMIT_SHA<br />
https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values#using_default_substitutions<br />

# ansible_scripts

Ansible for IoC...
-------------

```
cd /home/amjada/amjada/ansible_scripts
ansible-playbook -vvv -i inventory/gcp_value.yaml k8s.yaml
ansible-playbook -vvv -i inventory/gcp_value.yaml db.yaml --ask-vault-pass


ansible-galaxy collection list
ansible-galaxy collection install <collection-name> --upgrade
ansible-galaxy collection install google.cloud --upgrade
ansible-doc google.cloud

```

#### GKE created
<img src="images/gke_create.JPG" />

#### Manually Create Docker Repo...
<img src="images/create_docker_repo.JPG" width="400"/>

#### Cloud SQL "private ip" is NOT supported properly in Ansible module
  gcp_sql_instance:
    settings:
      ip_configuration:
        ipv4_enabled : no
        authorized_networks:
        - name: centos_7
          value: "{{ centos_7_ip }}"

I would receive the error:
At least one of Public IP or Private IP connectivity must be enabled..
Searching google showed converting public to private  has to be done manually after the fact:
gcloud beta sql instances patch app2-instance \
  --project=silicon-pointer-146802 \
  --network=projects/silicon-pointer-146802/northamerica-northeast2/networks/default \
  --no-assign-ip

I simply did it through the console for now. NOTE: everything works fine through Ansible if I use Public IP and restric based on "authorized_networks" which should satisfy "DB tier should not be
accessible from the internet."

#### Commands to remember...
```
virtualenv -p /usr/bin/python3 ~/venv
source ~/venv/bin/activate
ansible-galaxy collection install google.cloud


gcloud projects list
PROJECT_ID              NAME              PROJECT_NUMBER
silicon-pointer-146802  My First Project  18511458794


gcloud iam service-accounts keys list --iam-account=silicon-pointer-146802@appspot.gserviceaccount.com
```


#### Helpful links...
https://www.economize.cloud/resources/regions-zones-map<br />
https://cloud.google.com/sql/docs/mysql/instance-settings<br />
https://docs.w3cub.com/ansible~2.9/modules/gcp_sql_instance_module#examples<br />
---this “private IP security pattern” has been built for legacy...<br />
https://medium.com/google-cloud/cloud-sql-with-private-ip-only-the-good-the-bad-and-the-ugly-de4ac23ce98a<br />
https://cloud.google.com/vpc/docs/configure-private-services-access<br />
ansible encryption<br />
https://stackoverflow.com/questions/30209062/ansible-how-to-encrypt-some-variables-in-an-inventory-file-in-a-separate-vault<br />
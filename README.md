# demo of terraform + ansible

## create resource by terraform

```
terraform apply -var-file ./env/dev.tfvars
```

## run playbook

```
cd ./ansible
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_TF_DIR=..
export ANSIBLE_NOCOWS=1
ansible-playbook -i ./terraform.py playbook.yml
```

## other playbook

- `ping.yml` show hostname and uptime for ALL hosts

# for new provider

```
terraform init -plugin-dir ./providers
terraform plan -var-file ./inputs/default.tfvars

```

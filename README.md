# Packer test

Test packer as package builder for OFN

To create a docker image and upload it to docker hub (like here https://hub.docker.com/repository/docker/olivier5741/learn-packer) with Packer

```
cd packer-test
packer build -var "docker_hub_account=YOUR_ACCOUNT" -var "docker_hub_password=YOUR_PASSWORD" .
```

(there is probably a better way than using account-password credentials)

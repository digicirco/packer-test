# Packer test

Test packer as package builder for OFN

```
cd packer-test
packer build -var "docker_hub_account=YOUR_ACCOUNT" -var "docker_hub_password=YOUR_PASSWORD" .
```

(there is probably a better way than using account-password credentials)

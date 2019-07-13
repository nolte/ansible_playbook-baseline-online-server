# Server Base Configuration

This Repository will be handle the base configuration from Public Services, like Minecraft Server or Personal S3 Storage.  
Mostly hosted at [hetzner.cloud](https://docs.hetzner.cloud), and created with [Terraform](https://www.terraform.io/docs/providers/hcloud/index.html).

## Testing

For Locally automatical testing we use a Combination of Molecule and Vagrant

```bash
virtualenv -p python3 ~/venvs/develop-ansible_role-vagrant/
source ~/venvs/develop-ansible_role-vagrant/bin/activate
pip install -r requirements.txt
pre-commit install
```

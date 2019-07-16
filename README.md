# Base Service Configuration

This Repository will be handle the base configuration of Public Services, like Minecraft Server or Personal S3 Storage, a try dont get any [Snowflake Server](https://martinfowler.com/bliki/SnowflakeServer.html).  
Mostly hosted at [hetzner.cloud](https://docs.hetzner.cloud), and created with [Terraform](https://www.terraform.io/docs/providers/hcloud/index.html).

## Features

* harder ``sshd``
    * configure ``fail2ban``
* install ``restic``
* base ``logrotate`` configuration
* configure ``MotD`` (Message of the Day)
* install ``python3``
* configure system ``timezone``
* configure ``docker`` (optional)
* execute ``open-scap-scan`` (planed)
* configure ``aide`` (planed)


### Out of Scope

* Provide any Infrastructure (see [nolte/terraform-infrastructure-modules](https://github.com/nolte/terraform-infrastructure-modules))
* Install any Services, like Minecraft ([nolte/minecraft-infrastructure](https://github.com/nolte/minecraft-infrastructure)), or MinIO ([nolte/personal-storage-infrastructure](https://github.com/nolte/personal-storage-infrastructure)).

## Usage

### Prepare Python Env

```bash
virtualenv -p python3 ~/venvs/develop-ansible_role-vagrant
source ~/venvs/develop-ansible_role-vagrant/bin/activate
pip install -r requirements.txt
pre-commit install
ansible-galaxy install -r requirements.yml
```

### Start SSH Agent

```bash
pass private/keyfiles/ssh/ansible_rollout/passphrase -c
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/ansible_id_ed25519
```

### Playbooks

| playbook                               | ansible_group | description                                                      |
|----------------------------------------|---------------|------------------------------------------------------------------|
| ``master-configure-system.yml``        |               | master playbook for combine the base and docker playbook.        |
| ``playbook-base-configureation.yml``   | _all_         | Configure the base system.                                       |
| ``playbook-docker-configureation.yml`` | _dockerbased_ | Prepare the System for docker Usage                              |


```bash
export ANSIBLE_INVENTORY=$(pwd)/prod
ansible-playbook master-configure-system.yml
```

## Development

For Locally automatical testing we use a Combination of Molecule and Vagrant

```bash
virtualenv -p python3 ~/venvs/develop-ansible_role-vagrant/
source ~/venvs/develop-ansible_role-vagrant/bin/activate
pip install -r requirements.txt
pre-commit install
```

### Testing

running the tests:

```bash
molecule test
```

#### Infrastructure Tests


```bash
pytest --connection=ansible --hosts=all test/*
```

### Reusing and Sharing

For reusing and sharing you can create own vagrant box with the Packer File under ``/build``.

```bash
source ~/venvs/develop-ansible_role-vagrant/bin/activate
ansible-galaxy install -r requirements.yml
cd build

packer build base_centos.json
vagrant box add base-box file:///$(pwd)/.output-vagrant-base/package.box --force

packer build base_docker_box.json
vagrant box add docker-box file:///$(pwd)/.output-vagrant-docker/package.box --force
```

### Releasing

Must be executed from the ``develop`` branch.

```bash
pre-commit uninstall \
    && bumpversion --tag release --commit \
    && git checkout master && git merge develop && git checkout develop \
    && bumpversion --no-tag patch --commit \
    && git push origin master --tags \
    && git push origin develop \
    && pre-commit install
```

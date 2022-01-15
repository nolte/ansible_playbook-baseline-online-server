# Base Service Configuration

[![Github Project Stars](https://img.shields.io/github/stars/nolte/ansible_playbook-baseline-online-server.svg?label=Stars&style=social)](https://github.com/nolte/ansible_playbook-baseline-online-server) [![Travis CI build status](https://travis-ci.org/nolte/ansible_playbook-baseline-online-server.svg?branch=master)](https://travis-ci.org/nolte/ansible_playbook-baseline-online-server) [![Documentation Status](https://readthedocs.org/projects/ansible_playbook-baseline-online-server/badge/?version=latest)](https://ansible_playbook-baseline-online-server.readthedocs.io/en/stable/?badge=stable) [![Github Issue Tracking](https://img.shields.io/github/issues-raw/nolte/ansible_playbook-baseline-online-server.svg)](https://github.com/nolte/ansible_playbook-baseline-online-server) [![Github LatestRelease](https://img.shields.io/github/release/nolte/ansible_playbook-baseline-online-server.svg)](https://github.com/nolte/ansible_playbook-baseline-online-server)

This Repository will be handle the base configuration of Public Services, like [Minecraft Server](https://github.com/nolte/minecraft-infrastructure) or [Personal S3 Storage](https://github.com/nolte/personal-storage-infrastructure), a try dont get any [Snowflake Server](https://martinfowler.com/bliki/SnowflakeServer.html).
Mostly hosted at [hetzner.cloud](https://docs.hetzner.cloud), and created with [Terraform](https://www.terraform.io/docs/providers/hcloud/index.html).

## Features

* harder ``sshd``
    * configure ``fail2ban``
* install ``restic``
* base ``logrotate`` configuration
* configure ``MotD`` (Message of the Day)
* install ``python3``
* configure system ``ntp`` for time handling
* configure ``docker`` (optional)
* Security Scans
    * execute ``open-scap-scan``
    * root kit analyse with ``rkhunter``
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
export HCLOUD_TOKEN=$(pass .../token)

ansible-playbook master-configure-system.yml
```

## Development

For Locally automatical testing we use a Combination of Molecule and Vagrant

```bash
virtualenv -p python3 ~/venvs/ansible-vagrant/
source ~/venvs/ansible-vagrant/bin/activate
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

For reusing and sharing you can create own vagrant box with the [Packer](packer.io) ``/packer``.

First Build the CentOS Base (WIP)

### Releasing

Must be executed from the ``develop`` branch.

```bash
pre-commit uninstall \
    && bump2version --tag release --commit \
    && git checkout master && git merge develop && git checkout develop \
    && bump2version --no-tag patch --commit \
    && git push origin master --tags \
    && git push origin develop \
    && pre-commit install
```

### Setup Local Env

```sh
asdf plugin-add packer https://github.com/Banno/asdf-hashicorp.git
asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf plugin-add python
asdf plugin-test act https://github.com/grimoh/asdf-act --asdf-tool-version latest
```

```
python -m venv env
source env/bin/activate
pip install -r requirements.txt
```

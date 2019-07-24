==================
Harder SSHd
==================

You must set your used ``private_key_file`` and some SSH Extra args ``-o IdentitiesOnly=yes``, otherwise the :term:`fail2ban` process will block your IP!.


.. _feature_harderssd_client_config:

Client Side SSH Configration
==================

One of the important config changes is ``StrictModes yes``, this required some changes at the Client Side.


.. code-block:: ini
    :caption: example ~/.ansible.cfg
    :name: example-config-ansible-cfg

    [defaults]
    validate_certs=False
    private_key_file=~/.ssh/ansible_id_ed25519

    [ssh_connection]
    ssh_extra_args=-o IdentitiesOnly=yes


.. code-block:: ini
    :caption: example ~/.ssh/config
    :name: example-config-ssh-config

    Host *
      IdentitiesOnly yes
      IdentityFile ~/.ssh/ansible_id_ed25519

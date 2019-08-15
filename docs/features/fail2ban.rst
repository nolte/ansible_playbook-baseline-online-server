.. _feature_fail2ban:

==================
Fail2Ban
==================

| :term:`fail2ban` is a good way to keep `Brute force attack <https://en.wikipedia.org/wiki/Brute-force_attack>`_'s  away from our System.
| The Base configuration will be done from the `robertdebock.fail2ban <https://github.com/robertdebock/ansible-role-fail2ban>`_ Ansible Role. For Client required configuration take a look at :ref:`feature_harderssd_client_config`.

Usefull Commands
==================

Show Current Jails

.. code-block:: bash
    :caption: list all jails
    :name: example-fail2ban-list-jails

    sudo su
    fail2ban-client status | sed -n 's/,//g;s/.*Jail list://p' | xargs -n1 fail2ban-client status



.. code-block:: bash

    Status for the jail: nginx-req-limit
    |- Filter
    |  |- Currently failed:	0
    |  |- Total failed:	0
    |  `- File list:	/var/log/nginx/error.log
    `- Actions
       |- Currently banned:	0
       |- Total banned:	0
       `- Banned IP list:
    Status for the jail: sshd
    |- Filter
    |  |- Currently failed:	16
    |  |- Total failed:	108
    |  `- Journal matches:	_SYSTEMD_UNIT=sshd.service + _COMM=sshd
    `- Actions
       |- Currently banned:	0
       |- Total banned:	3
       `- Banned IP list:


Additional Links
==================

some untested Prometheus Exporters

* `jangrewe/prometheus-fail2ban-exporter <https://github.com/jangrewe/prometheus-fail2ban-exporter>`_
* `Kylapaallikko/fail2ban_exporter <https://github.com/Kylapaallikko/fail2ban_exporter>`_

==================
Security Checks
==================

At the moment, execute the security checks is a Manual Step. The Future Plan is, to execute and report the scans by a Scheduler System.

open-scap-scan
==================

The :term:`OpenSCAP` Project make it easy to scan your Systems of existing Security vulnerable or configuration missmatch.


.. code-block:: bash
    :caption: execute checks
    :name: example-command-execute-open-scap-scan

    ansible-playbook playbook-execute-security-open-scap-scan.yml


The Generated Report will be stored at ``./generated_reports/oscap-reports/{{ inventory_hostname }}-{{ oscap_policy }}.html``


Root Kit Analyse
==================

For Root kit analyse we use the :term:`rkhunter` Tool.

.. code-block:: bash
    :caption: execute root kit checks
    :name: example-command-execute-rootkit-scan

    ansible-playbook playbook-execute-security-rootkit-scan.yml

The Generated Report will be stored at ``./generated_reports/rootkitscan/{{ inventory_hostname }}.txt``

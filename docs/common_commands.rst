==================
Common Commands Collection
==================



Ansible CMDB
==================================================

Be sure that you have prepared your local :ref:`Ansible <ref-getting-started-configure-ansible>`.

.. code-block:: shell
   :caption: Create A System HTML Overview
   :name: example-cmd-cmdb-create

   mkdir out
   ansible -i inventories/prod/ -m setup --tree out/ all
   ansible-cmdb -i inventories/prod out > output.html


Open Scap scan
==================================================

.. code-block:: shell
  :caption: destroy the Environment
  :name: example-cmd-env-destroy

  ansible-playbook -i inventories/prod maintenance/playbook-execute-security-open-scap-scan.yml

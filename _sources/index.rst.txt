==================
Base Service Configuration
==================

.. toctree::
   :caption: Table of Contents
   :name: mastertoc
   :maxdepth: 2

   readme
   features/index
   glossary


External Dependencies
==========

For Configure the Base we use a set of external ansible roles, hosted at `Ansible Galaxy <https://galaxy.ansible.com/>`_ and listed in ``requirements.yml``

.. literalinclude:: ../requirements.yml

Your can use the ``ansible-galaxy`` command for installation,

.. code-block:: bash

    ansible-galaxy install -r requirements.yml

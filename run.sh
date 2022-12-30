#!/bin/bash
#
# Updates the local role collection from the requirements definition
# before executing the playbook.
-------------------------------------------------------------------------------

# Install any required community roles from https://galaxy.ansible.com
ansible-galaxy install -r requirements.yml

# Execute the playbook
ansible-playbook playbook.yml -vv
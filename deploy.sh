#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i ansible/hosts ansible/site.yml

# An example to get 80% of memory

## Description

This ansible will be show an example to get 80% of your RAM basead in the ansible facts (ansible_memtotal_mb) and setup in config file.

### About ansible_memtotal_mb:

The `ansible_memtotal_mb` ansible facts will show your memory RAM in megabytes unit with one digit accuracy.

### An sort example

In this example, I'll show how to display the 80% of memory using the debug module.

```yaml
- name: Displaying 80% of memory
  hosts: localhost
  gather_facts: true
  become: false
  tasks:
  - name: Test
    debug: msg={{ ansible_memtotal_mb * 0.8 }}
```

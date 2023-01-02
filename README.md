_Note: This repository is a part of an article written about using Ansible to setup an Android development environment on an Ubuntu Linux system. The article can be found [here]()_

### Step 1: Initialization

This branch contains only the skeleton for the playbook being created, and does in fact not work in its current state as there are configurations missing to connect it to the bootstrapped client.

#### Files & Directories

Ansible is particular about certain files and directory structures. The following are only a small subset of them.

---

`ansible.cfg` contains the configurations that will be used by Ansible when running the _playbook_. In order:

- `inventory` points to the file defining the inventory of systems that Ansible will touch on. In turn each system defined in the inventory contains a variable file inside the `/host_vars/` directory. See the [official documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html) for more details.  

- `log_path` is the absolute path to where the logs should be stored when running the playbook.

- `retry_files_enabled` dictates if a retry file should be created when tasks fail, as these assist in retrying without running the whole playbook again.

- `private_key_file` is the absolute path to the private key part matching the public key used in the bootstrap script. This value has to be filled in.

- `remote_user` is the username that Ansible on the server will SSH in as on the client. This is the same user created with the use of the bootstrap script, and needs to be filled in.

---

`hosts` comes prefilled with a category 'workstation' and one such entity called 'client'. No changes needed here.

---

`/hosts/client` contains the variables relevant to this particular system. There are other ways of defining these variables (such as in the playbook it self) but I've found this to be the easiest way of defining variables for each host. 

It currently only holds two variables for the client (but will hold more in later sections):

- `ansible_host` either host name as recognized on the network or the IP address of the client. Needs to be filled out.

- `ansible_port` is the port used when SSH-ing into the client. This would be the same port as was used in the bootstrap script. Needs to be filled in.

---

`playbook.yml` contains at this moment only two differnt task groups, first a package manager updating task and then a cleanup task at the end. Later steps will add tasks to this file to accomplish the setup.

#### Verify

To verify that everything functions correctly try running the following command (-vv indicates verbosity):

```shell
ansible-playbook playbook.yml -vv
```

If everything is correctly setup then the client system should have its local `apt` package manager updated and cleaned. By adding more `v`'s to the command more verbosity can be gained. And the logs can be viewed in the log file whose location is defined inside the `ansible.cfg` file.

#### Next

When all relevant fields have been filled in, check out branch 2 for the next steps.

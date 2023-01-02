_Note: This repository is a part of an article written about using Ansible to setup an Android development environment on an Ubuntu Linux system. The article can be found [here](https://hth.is/2023/01/02/android-ansible/#step-2-java-installation)_

### Step 2: Java Installation

This branch builds upon the previous one by adding the first use of external _roles_ to install Java onto the system. The external repository for the _role_ is defined in the new file `requirements.yml`, which can be parsed by the command:

```shell
ansible-galaxy install -r requirements.yml
```

This will allow the use of the _role_ module in a task group inside the `playbook.yml` file:

```yml
- hosts: workstation
  become: true
  roles:
    - hth-java
```

And the configurations for the _role_ have been added to the `/host_vars/client` file. These should be changed based on your system preferences:

```ini
java_global: true
java_vendor: openjdk
java_type: jdk
java_version: 19
java_architecture: amd64
```

#### Verify

To verify that everything functions correctly try running the following command (-vv indicates verbosity):

```shell
ansible-playbook playbook.yml -vv
```

or try using the new `run.sh` script which combines parsing of the `requirements.yml` as well as executing the _playbook_.

Depending on the configuration you went with the client system should now have either the Java JDK or JRE installed. 

#### Next

Check out branch 3 for the next steps.

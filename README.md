_Note: This repository is a part of an article written about using Ansible to setup an Android development environment on an Ubuntu Linux system. The article can be found [here](https://hth.is/2023/01/02/android-ansible/#step-3-gradle)_

### Step 3: Gradle Installation

This branch builds upon the previous one by adding the second external _role_ that handles Gradle installation. The module has been added to the `requirements.yml` file and can be processed by running:

```shell
ansible-galaxy install -r requirements.yml
```

This will allow the use of the _role_ module in a task group inside the `playbook.yml` file:

```yml
- hosts: workstation
  become: true
  roles:
    - hth-java
    - hth-gradle
```

And the configurations for the _role_ have been added to the `/host_vars/client` file. These should be changed based on your system preferences:

```ini
gradle_global: true
gradle_version: "7.6"
gradle_version_checksum: 8cc27038d5dbd815759851ba53e70cf62e481b87494cc97cfd97982ada5ba634
```

#### Verify

To verify that everything functions correctly try running the following command (-vv indicates verbosity):

```shell
ansible-playbook playbook.yml -vv
```

or try using the new `run.sh` script which combines parsing of the `requirements.yml` as well as executing the _playbook_.

The client system should now have Gradle installed and accessible on the global path.

#### Next

Check out branch 4 for the next steps.

_Note: This repository is a part of an article written about using Ansible to setup an Android development environment on an Ubuntu Linux system. The article can be found [here](https://hth.is/2023/01/02/android-ansible/#step-5-android-studio)_

### Step 5: Android Studio Installation

This branch builds upon the previous one by adding the fourth external _role_ that handles Android Studio installation. The module has been added to the `requirements.yml` file and can be processed by running:

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
    - hth-android-sdk
    - hth-android-studio
```

And the configurations for the _role_ have been added to the `/host_vars/client` file. These should be changed based on your system preferences:

```ini
android_studio_path: "/opt/android-studio"
android_studio_clients:
  - version: "2022.2.1.9"
    checksum: "7e7868b83bca8255f690e6c7fe026a3f3be1e140d2f09682c2b150af8cf93550"
  - version: "2021.3.1.17"
    checksum: "89adb0ce0ffa46b7894e7bfedb142b1f5d52c43c171e6a6cb9a95a49f77756ca"
android_studio_primary:
  version: "2021.3.1.17"
  desktop: 
    create: yes
    name: "AStudio Stable"
android_studio_canary: 
  version: "2022.2.1.9"
  desktop: 
    create: yes
    name: "AStudio Canary"
```

#### Verify

To verify that everything functions correctly try executing the `run.sh` script.

The client system should now have the Android Studio installed and accessible globally.

#### Next

This is the last step. See the article for the conclusions.

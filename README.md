_Note: This repository is a part of an article written about using Ansible to setup an Android development environment on an Ubuntu Linux system. The article can be found [here]()_

### Step 4: Android SDK Installation

This branch builds upon the previous one by adding the thirds external _role_ that handles Android SDK installation. The module has been added to the `requirements.yml` file and can be processed by running:

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
```

And the configurations for the _role_ have been added to the `/host_vars/client` file. These should be changed based on your system preferences:

```ini
android_user_home: ".android"
android_adb_to_path: true
android_sdkmanager_to_path: true
android_cmdlinetools_bootstrap_build: 9123335
android_cmdlinetools_bootstrap_checksum: "0bebf59339eaa534f4217f8aa0972d14dc49e7207be225511073c661ae01da0a"
android_requested_sdk:
  build_tools:
    - version: "33.0.0"
      channel: 2
    - version: "31.0.1"
      channel: 0
    - version: "29.0.2"
      channel: 0
  platforms:
    - version: 33
      channel: 2
    - version. 29
      channel: 0
  platform_tools:
    channel: 0
```

#### Verify

To verify that everything functions correctly try executing the `run.sh` script.

The client system should now have the Android SDK installed and accessible on the global path. 

#### Next

Check out branch 5 for the last step.

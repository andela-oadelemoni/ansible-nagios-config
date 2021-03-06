# Nagios Configuration with Ansible
Setting up Nagios on your server can be a really long process and you might want to set it up for multiple servers as well. In order to take the pain out of this process, we're using Ansible to write the configuration script to automatically download and setup Nagios Core the server.

This script was written for `Ubuntu 14.04.4 LTS` server.

**To get started,**
###### 1. Open `hosts` file in the project root directory and enter your host name(s) with DNS name or IP address. Also enter path to ssh key file

```
[hostname]
# Enter IP Address or DNS name e.g www.example.com and path to key file like below:
# 10.10.10.10 ansible_ssh_private_key_file=<path to key file>
```
###### 2. Open `config_vars.yml` in playbooks directory and enter the required variables like this:
```ruby
host: hostname # same value entered above 
user: username # ssh user

nagios: nagios-4.1.1 # nagios core version
nagios_plugin: nagios-plugins-2.1.1 # nagios plugin version
install_nagios_plugin: true # set this to false if you do not want default nagios plugins installed
nrpe: nrpe-2.15 # nrpe version

email: example@email.com # email address
nagios_password: password # password to login to nagios server
```

### Running Playbook with Cucumber
To run the playbook with Cucumber BDD Testing, open `vars.rb` file in `features/step_definitions` and enter in the required variables like this:
```ruby
# Enter path to private key
PATH_TO_PRIVATE_KEY = ""

# Enter server SSH command here
SSH_COMMAND = ""

# Enter server PING command to check if server is available here
PING_COMMAND = ""

# Enter server provisioning command here. You may use the same ping command above
PROVISION_COMMAND = ""
```

**Next step is to run the following command**
```sh
$ cucumber features/install.feature
```
*If you don't have cucumber installed, visit cucumber.io for installation guide.*

### Running Playbook Directly

*If you do not have `Apache`, `MySQL`, and `PHP` setup on your server, run the below playbook. If you have all that setup, run only the second playbook*

First:
```sh
$ ansible-playbook -i hosts playbooks/lamp.yml
```
Second:
```sh
$ ansible-playbook -i hosts playbooks/nagios.yml
```

***Happy Configuring :)***


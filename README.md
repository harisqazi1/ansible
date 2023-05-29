# Ansible Playbooks



## Linux (Ubuntu)

Installing Ansible:

```bash
#Download pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#Install pip
python3 get-pip.py --user
#Install Ansible
python3 -m pip install --user ansible
#Upgrade Ansible
python3 -m pip install --upgrade --user ansible
ansible --version
#Adding Ansible command shell completion
python3 -m pip install --user argcomplete
activate-global-python-argcomplete --user
```


Capabilities:
- 

Sources:
- https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html
- https://github.com/AlexNabokikh/ubuntu-playbook
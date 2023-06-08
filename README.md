# Ansible Playbooks



## Linux (Ubuntu)

Installing Ansible:

```bash
# Install Ansible
sudo apt install ansible
# Download this repository
git clone https://github.com/harisqazi1/ansible.git
# Change Directory into the repo
cd ansible
# Install Roles from Ansible Galaxy
ansible-galaxy install -r requirements.yml
# Run the playbook
ansible-playbook -i inventory.ini ubuntu.yml -K 
```


Capabilities:
- 

Sources:
- https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html
- https://github.com/AlexNabokikh/ubuntu-playbook
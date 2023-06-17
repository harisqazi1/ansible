# Ansible Playbooks



## Linux (Pop!_OS)

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
ansible-playbook -i inventory.ini Pop\!_OS.yml -K 
```


Capabilities:
- 

Sources:
- https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html
- https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html#yaml-syntax
- https://galaxy.ansible.com/gantsign/oh-my-zsh
- https://github.com/AlexNabokikh/ubuntu-playbook/blob/master/main.yml
- https://github.com/veggiemonk/ansible-ohmyzsh/blob/master/tasks/main.yml
- https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html
- https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_delegation.html#local-playbooks
- https://www.jeffgeerling.com/blog/2022/aptkey-deprecated-debianubuntu-how-fix-ansible
- https://stackoverflow.com/questions/71585303/how-can-i-manage-keyring-files-in-trusted-gpg-d-with-ansible-playbook-since-apt
- https://stackoverflow.com/questions/71995796/installing-the-deb-package-via-ansible
- https://www.howtouselinux.com/post/ansible-loop-over-items-with-a-pause-between-iterations
- https://stackoverflow.com/a/50923310
- https://github.com/staticdev/ansible-role-brave/blob/main/tasks/main.yml
- https://kiwix.ounapuu.ee/content/askubuntu.com_en_all_2022-11/questions/910821/programs-installed-via-snap-not-showing-up-in-launcher
- https://9to5answer.com/snap-installed-applications-not-showing-on-launcher
- https://askubuntu.com/questions/800685/add-a-snap-icon-to-the-desktop-ubuntu-16-04
- https://raw.githubusercontent.com/staticdev/ansible-role-brave/main/tasks/main.yml
- https://github.com/AlexNabokikh/ubuntu-playbook/blob/master/tasks/extra_packages.yml
- https://github.com/AlexNabokikh/ubuntu-playbook/blob/master/tasks/hostname.yml
- https://stackoverflow.com/questions/40230184/how-to-do-multiline-shell-script-in-ansible#40230416
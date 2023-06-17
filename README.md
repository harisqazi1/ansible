# Ansible Playbooks

## Linux (Pop!_OS)

### Installing Ansible and Running the Playbook:

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
## NOTE

I have used some "loop_control"s to give the system some time to release the dpkg locks. It is currently 10 seconds. This will make the playbook take much longer, but it should complete in one run.

## Directory Layout

```
.
└── ansible/
    ├── tasks/ 
    │   ├── apt_signed.yml
    │   ├── apt.yml
    │   ├── brave.yml
    │   ├── cheat.yml
    │   ├── deb_packages.yml
    │   ├── dotfiles.yml
    │   ├── flatpak.yml
    │   ├── hardening.yml
    │   ├── hostname.yml
    │   ├── npm.yml
    │   ├── post_install.yml
    │   ├── snap.yml
    │   ├── theme_icons.yml
    │   ├── tor.yml
    │   └── tweaks.yml
    ├── LICENSE
    ├── POP!_OS.yml                 # Main Playbook
    ├── README.md                   # Readme file
    ├── config.yml                  # Configuration / Variable file
    ├── inventory.ini               # Inventory list
    └── requirements.yml            # Roles used in Playbook
```

## Capabilities:

To create this playbook, I referenced Alexander Nabokikh's playbook (https://github.com/AlexNabokikh/ubuntu-playbook/) a good amount. Therefore, it would be unfair if I did not give credit where it is due.

- Install apt packages that are signed (me)
- Install apt packages (Alexander Nabokikh)
- Install Brave (can't recall location, but was copied from Ansible Galaxy)
- Install cheat (me)
- Install .deb packages from source (me)
- Download dotfiles (me)
- Install flatpaks (Alexander Nabokikh)
- Hardening the OS a bit (me)
- Modify the hostname (Alexander Nabokikh)
- Install npm packages (Alexander Nabokikh)
- Install snap packages (Alexander Nabokikh)
- Installing a theme and the icon pack (me)
- Downloading TOR from source (me)
- Tweaking Gnome with Gsettings (me)

## Maintenance:
Some items in the playbook rely on outside factors, such as links. Here are what is needed to be maintained for the playbook to work as expected.
- tasks/tor.yml - Updating the link for TOR
- tasks/cheat.yml - Updating the link for cheat
- tasks/deb_packages.yml - Updating the link for VeraCrypt

## Post-Install Tasks
Here are some tasks for me that I would do after this playbook has completed:
- Run `p10k configure` to configure ohmyzsh
- Download the archenfox/user.js config for FireFox
- Update the refresh rate
- Update DNS in browsers and on the OS
- Make MPV default video player
- Move the dock to the left side
- If you are using two monitors, and if the login page moves over to your secondary monitor
    - `sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/`

## Sources:
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
- https://stackoverflow.com/questions/47994497/how-to-pipe-commands-using-ansible-e-g-curl-sl-host-com-sudo-bash
- https://serverfault.com/questions/939671/ansible-expect-is-not-sending-response
# Ansible Playbooks

## Debian + Kicksecure

### Installing Ansible and Running the Debian + Kicksecure  Playbook

The initial steps are for a user who wants to have the user account not have sudo access, and instead give sudo access to another user as a safety precaution.

For better security follow the following when Installing Debian:

- Set username to `user` to make it generic
- Set password to a 3+ word passphrase
- Set hostname to `localhost`, again to make it generic
- As the Ansible playbook is meant for Gnome, make sure to install Gnome
- Enable Full Disk Encryption (Encrypted LVM volume)

```bash
# Add /sbin to path to include its binaries in command line
export PATH=/sbin:$PATH
# Source the profile for the environment for previous export to be permanent
source ~/.profile
# User does not have sudo access, so switch to root
su root #`su` could be used, as it assumes root by default
# Adduser to sudo group
adduser user sudo
# Reboot to allow user to get perms to sudoers
reboot
# Install git and Ansible
sudo apt install git ansible -y
# Download this repository
git clone https://github.com/harisqazi1/ansible.git
# Change Directory into the repo
cd ansible
# Install Roles from Ansible Galaxy
ansible-galaxy install -r requirements.yml
# Run the playbook
ansible-playbook -i inventory.ini Debian.yml -K 
# Manually remove user to sudo group (sudoers) added manually before
## sudo access will still be there
sudo visudo
#Reboot to finalize changes
reboot
```

## Pop!_OS

### Installing Ansible and Running the Pop!_OS Playbook:

```bash
# Install Ansible
sudo apt install ansible -y
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

I have used some "loop_control"s to give the system some time to release the dpkg locks. It is currently 7 seconds. This will make the playbook take much longer, but it should complete in one run.

## Capabilities:

To create this playbook, I referenced Alexander Nabokikh's playbook (https://github.com/AlexNabokikh/ubuntu-playbook/) a good amount. Therefore, it would be unfair if I did not give credit where it is due.

- Install apt packages that are signed (me)
- Install apt packages (Alexander Nabokikh)
- Install .deb packages from source (me)
- Install flatpaks (Alexander Nabokikh)
- Hardening the OS a bit (me)
- Modify the hostname (Alexander Nabokikh)
- Install npm packages (Alexander Nabokikh)
- Install snap packages (Alexander Nabokikh)
- Installing a theme and the icon pack (me)
- Downloading TOR and Mullvad Browser from source (me)
- Tweaking Gnome with Gsettings (me)

## Maintenance:
Some items in the playbook rely on outside factors, such as links. Here are what is needed to be maintained for the playbook to work as expected.
- tasks/tor.yml - Updating the link for TOR
- tasks/deb_packages.yml - Updating the link for VeraCrypt

## Post-Install Tasks for both playbooks
- OhMyZsh Install
	- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
	- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
	- `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
	- `plugins=( git zsh-syntax-highlighting zsh-autosuggestions )` in `~/.zshrc`
- Starship setup with https://starship.rs/presets/tokyo-night Preset
	- Grab Glyphs from https://www.nerdfonts.com/cheat-sheet, if needed
- Terminal settings
	- Make ZSH profile primary
	- Uncheck "Use Transparency from system"
	- Change color to ~10%
	- Change Default color to black
- Desktop > Dock > Dock Visibility > Intelligently hide
- Update DNS in browsers to custom DNS
- NextDNS install on system
- `./start-mullvad-browser.desktop --register-app` to add mullvad to application list
- In case of bug with gdm to change login screen
	- Go into Settings > Devices > Displays; Configure; Save
	- `sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml`
	- `sudo chown gdm:gdm ~gdm/.config/monitors.xml`
	- Reboot

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
- https://dev.to/waylonwalker/installing-system-nerd-fonts-with-ansible-35kh
- https://www.cyberciti.biz/tips/howto-write-shell-script-to-add-user.html
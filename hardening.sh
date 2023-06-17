# Script for harding Ubuntu-based OS
# based on https://privsec.dev/posts/linux/desktop-linux-hardening/

# to get the username even when sudo is used
user=${SUDO_USER:-$USER}  

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# NetworkManager Trackability Reduction
bash -c 'cat << EOF >> /etc/NetworkManager/conf.d/00-macrandomize.conf
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF'

# Restart NetworkManager service
systemctl restart NetworkManager

# set hostname to "localhost"
hostnamectl hostname "localhost"

# Add multiverse to access microcode package
add-apt-repository multiverse

# Install microcode package
apt install microcode

# Update firmware metadata
fwupdmgr refresh

# Download and install firmware updates
fwupdmgr update
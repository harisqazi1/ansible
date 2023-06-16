# Script for harding Ubuntu-based OS
# based on https://privsec.dev/posts/linux/desktop-linux-hardening/#microcode-updates


# NetworkManager Trackability Reduction
# 
echo "[device]\nwifi.scan-rand-mac-address=yes\n\nwifi.cloned-mac-address=random\nethernet.cloned-mac-address=random" > /etc/NetworkManager/conf.d/00-macrandomize.conf

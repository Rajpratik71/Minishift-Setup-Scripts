#  ____       _   _   _               _   _       
# / ___|  ___| |_| |_(_)_ __   __ _  | | | |_ __  
# \___ \ / _ \ __| __| | '_ \ / _` | | | | | '_ \ 
#  ___) |  __/ |_| |_| | | | | (_| | | |_| | |_) |
# |____/ \___|\__|\__|_|_| |_|\__, |  \___/| .__/ 
#                             |___/        |_|    
#  __  __ _       _     _     _  __ _   
# |  \/  (_)_ __ (_)___| |__ (_)/ _| |_ 
# | |\/| | | '_ \| / __| '_ \| | |_| __|
# | |  | | | | | | \__ \ | | | |  _| |_ 
# |_|  |_|_|_| |_|_|___/_| |_|_|_|  \__|
#
#
# Installing libvirt and qemu-kvm
#
sudo apt-get --allow-unauthenticated --no-install-recommends --default-release=xenial-updates install libvirt-bin qemu-kvm
#
# Configuring unconfigured Packages
#
sudo dpkg --configure -a
#
# Adding libvirt or libvirtd to group
#
sudo usermod -a -G libvirtd $(whoami)
#
# Updating Session Variables
#
sudo newgrp libvirtd
#
# Installing KVM driver binary
#
sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04 -o /usr/local/bin/docker-machine-driver-kvm
#
# Setting Up Permissions
#
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm
#
# Checking If libvirt Service is running
#
sudo systemctl is-active libvirtd
#
# Work around for Service not running
#
sudo systemctl start libvirtd
#
# Configuring libvirt Networking
#
# Checking network status
#
sudo virsh net-list --all
#
# Work around for network not running
#
sudo virsh net-start default
#
# Setting Network for autostart
#
sudo virsh net-autostart default
#
# Downloading Minishift binary
#
sudo wget https://github.com/minishift/minishift/releases/download/v1.34.1/minishift-1.34.1-linux-amd64.tgz
#
# Extracting Content
#
sudo tar -xvf minishift-1.34.1-linux-amd64.tgz
#
# Moving binary to /usr/local/bin/
#
sudo mv minishift-1.34.1-linux-amd64/minishift /usr/local/bin/
#
# Making the binary executable
#
sudo chmod +x /usr/local/bin/minishift
#
# Installing and Setting Up Minishift done
#
# Running Minishift
#
minishift
#
# Follow Minishift Quickstart at https://docs.okd.io/latest/minishift/getting-started/quickstart.html
# Thank you.

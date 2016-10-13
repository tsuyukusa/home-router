#!/bin/bash

# common
sudo apt update

# docker
wget https://get.docker.com/ | sudo sh

# ovs
sudo apt install openvswitch-switch openvswitch-common

# ovs-docker
wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
chmod +x ovs-docker
sudo mv ovs-docker /usr/local/bin/

sudo ovs-vsctl add-br ovs-lan1


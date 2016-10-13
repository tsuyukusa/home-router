#!/bin/bash

export USERNAME=tm
export INBRIDGE=ovs-lan1
export INNIC0=enp0s25
export INNIC1=eth2
export WLNIC=wls3

function install-package(){
    # common
    sudo apt update

    # docker
    wget https://get.docker.com/ | sudo sh
    sudo usermod -aG docker $USERNAME

    # ovs
    sudo apt install openvswitch-switch openvswitch-common -y

    # ovs-docker
    wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
    chmod +x ovs-docker
    sudo mv ovs-docker /usr/local/bin/
}

function setup-ovs(){
    sudo ovs-vsctl add-br $INBRIDGE
    sudo ovs-vsctl add-port $INNIC1
}

install-package
setup-ovs

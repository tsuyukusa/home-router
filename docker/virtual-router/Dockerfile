FROM ubuntu:14.04
MAINTAINER T.M.

RUN apt update
RUN apt install -y iptables isc-dhcp-server vim fping nmap tcpdump

RUN sysctl -w net.ipv4.ip_forward=1

ADD files/dhcpd.conf /etc/dhcp/dhcpd.conf

WORKDIR /root


#!/bin/bash

wget http://download.configserver.com/csf.tgz

tar -xzf csf.tgz


systemctl disable firewalld
systemctl stop firewalld

yum -y install iptables-services
touch /etc/sysconfig/iptables
touch /etc/sysconfig/iptables6

systemctl start iptables
systemctl start ip6tables
systemctl enable iptables
systemctl enable ip6tables

cd csf
sh install.sh

perl /usr/local/csf/bin/csftest.pl


# nano /etc/csf/csf.conf

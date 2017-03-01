#!/bin/bash

#http://eng-entrance.com/linux-firewall

#clear
iptables -F
iptables -X
#policy
iptables -P INPUT   DROP
iptables -P FORWARD DROP
iptables -P OUTPUT  ACCEPT

#ssh
iptables -A INPUT -p tcp --dport 49810 -j ACCEPT

#ping
iptables -I INPUT -p icmp --icmp-type 0 -j ACCEPT
iptables -I INPUT -p icmp --icmp-type 8 -j ACCEPT

#local loop back
iptables -A INPUT -i lo -j ACCEPT

#accept
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#log
iptables -A INPUT -j LOG --log-prefix "drop_packet:" 

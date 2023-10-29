#!/bin/bash

yay -S xl2tpd strongswan networkmanager-l2tp bind

sudo ln -sf $(pwd)/vpn/vpn-start /usr/local/bin/vpn-start
sudo ln -sf $(pwd)/vpn/vpn-stop /usr/local/bin/vpn-stop

# export VPN_SERVER_IP=$(dig office.plingot.com +short)
export VPN_SERVER_IP="185.96.154.145"
echo -n "IPSec PSK: "
read -s PSK
echo
export VPN_IPSEC_PSK="0s$(echo -n "${PSK}" | base64)"
echo -n "IPSec User: "
read -s VPNUSER
echo
export VPN_USER="${VPNUSER}"
echo -n "IPSec Password: "
read -s VPNPASSWORD
export VPN_PASSWORD="0s$(echo -n "${VPNPASSWORD}" | base64)"
echo

nmcli c add con-name Plingot type vpn vpn-type l2tp vpn.data "gateway=${VPN_SERVER_IP}, ipsec-enabled=yes, ipsec-psk=${VPN_IPSEC_PSK}, password-flags=1, user=${VPN_USER}"
nmcli con modify Plingot vpn.secrets "password=${VPN_PASSWORD}"

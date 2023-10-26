#!/bin/bash

yay -S strongswan xl2tpd bind

sudo ln -sf $(pwd)/vpn/vpn-start /usr/local/bin/vpn-start
sudo ln -sf $(pwd)/vpn/vpn-stop /usr/local/bin/vpn-stop

export VPN_SERVER_IP=$(dig office.plingot.com +short)
echo -n "IPSec PSK: "
read -s PSK
echo
export VPN_IPSEC_PSK="${PSK}"
echo -n "IPSec User: "
read -s VPNUSER
echo
export VPN_USER="${VPNUSER}"
echo -n "IPSec Password: "
read -s VPNPASSWORD
export VPN_PASSWORD="${VPNPASSWORD}"
echo

sudo tee /etc/ipsec.conf > /dev/null <<EOF
# ipsec.conf - strongSwan IPsec configuration file

# basic configuration

config setup
  # strictcrlpolicy=yes
  # uniqueids = no

# Add connections here.

# Sample VPN connections

conn %default
  ikelifetime=60m
  keylife=20m
  rekeymargin=3m
  keyingtries=1
  keyexchange=ikev1
  authby=secret
  ike=aes128-sha1-modp2048!
  esp=aes128-sha1-modp2048!

conn plingot
  keyexchange=ikev1
  left=%defaultroute
  auto=add
  authby=secret
  type=transport
  leftprotoport=17/1701
  rightprotoport=17/1701
  right=$VPN_SERVER_IP
EOF

sudo tee /etc/ipsec.secrets > /dev/null <<EOF
: PSK "$VPN_IPSEC_PSK"
EOF

sudo chmod 600 /etc/ipsec.secrets

sudo tee /etc/xl2tpd/xl2tpd.conf > /dev/null <<EOF
[lac plingot]
lns = $VPN_SERVER_IP
ppp debug = yes
pppoptfile = /etc/ppp/options.l2tpd.client
length bit = yes
EOF

sudo tee /etc/ppp/options.l2tpd.client > /dev/null <<EOF
ipcp-accept-local
ipcp-accept-remote
refuse-eap
require-chap
noccp
noauth
mtu 1280
mru 1280
noipdefault
defaultroute
usepeerdns
connect-delay 5000
name $VPN_USER
password $VPN_PASSWORD
EOF

sudo chmod 600 /etc/ppp/options.l2tpd.client

sudo systemctl enable strongswan
sudo systemctl enable strongswan-starter
sudo systemctl enable xl2tpd
sudo systemctl start strongswan
sudo systemctl start strongswan-starter
sudo systemctl start xl2tpd

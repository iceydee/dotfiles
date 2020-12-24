#!/bin/bash

if [ "${UID}" != 0 ]; then
  echo "erorr: must be run as root!"
  exit 1
fi

apt -y install strongswan xl2tpd net-tools

ln -sf $(pwd)/vpn/vpn-start /usr/local/bin/vpn-start
ln -sf $(pwd)/vpn/vpn-stop /usr/local/bin/vpn-stop

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

cat > /etc/ipsec.conf <<EOF
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

cat > /etc/ipsec.secrets <<EOF
: PSK "$VPN_IPSEC_PSK"
EOF

chmod 600 /etc/ipsec.secrets

cat > /etc/xl2tpd/xl2tpd.conf <<EOF
[lac plingot]
lns = $VPN_SERVER_IP
ppp debug = yes
pppoptfile = /etc/ppp/options.l2tpd.client
length bit = yes
EOF

cat > /etc/ppp/options.l2tpd.client <<EOF
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

chmod 600 /etc/ppp/options.l2tpd.client

service ipsec restart
service xl2tpd restart

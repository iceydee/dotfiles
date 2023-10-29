# VPN Config

[Setup VPN](https://gist.github.com/pastleo/aa3a9524664864c505d637b771d079c9)

## Steps

1. yay -S xl2tpd strongswan networkmanager-l2tp
1. nmcli c add con-name CON_NAME type vpn vpn-type l2tp vpn.data 'gateway=GATEWAY_HOST, ipsec-enabled=yes, ipsec-psk=PRE_SHARED_KEY, password-flags=2, user=USERNAME'

NB. ipsec-psk should be prefixed with 0s and base64 encoded

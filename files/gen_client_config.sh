#/bin/bash
SERVER_PUBLIC_KEY=$(cat /etc/wireguard/keys/server-publickey)
CLIENT_PRIVATE_KEY=$(cat /etc/wireguard/keys/$1-privatekey)

cat <<EOF
[Interface]
PrivateKey = $CLIENT_PRIVATE_KEY
Address = $2
DNS = 8.8.8.8

[Peer]
PublicKey = $SERVER_PUBLIC_KEY
AllowedIPs = $5
Endpoint = $3:$4
EOF
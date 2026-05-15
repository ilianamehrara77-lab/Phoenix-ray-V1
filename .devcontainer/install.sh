#!/bin/bash

set -e

echo "[install] downloading xray..."

wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip

echo "[install] extracting..."

unzip /tmp/xray.zip -d /tmp/xray

chmod +x /tmp/xray/xray
mv /tmp/xray/xray /usr/local/bin/xray

echo "[install] cleanup..."

rm -rf /tmp/xray /tmp/xray.zip

echo "[install] installed successfully!"

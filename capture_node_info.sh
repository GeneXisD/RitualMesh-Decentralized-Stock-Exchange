#!/usr/bin/env bash
set -u

OUTPUT_FILE="node_info.txt"

echo "===================================="
echo " RitualMesh Node Info Capture"
echo "===================================="
echo ""

HOSTNAME_VAL="$(hostname 2>/dev/null || echo unknown-host)"

IP_VAL=""
if command -v ipconfig >/dev/null 2>&1; then
  IP_VAL="$(ipconfig getifaddr en0 2>/dev/null || true)"
  if [ -z "$IP_VAL" ]; then
    IP_VAL="$(ipconfig getifaddr en1 2>/dev/null || true)"
  fi
fi

if [ -z "$IP_VAL" ] && command -v hostname >/dev/null 2>&1; then
  IP_VAL="$(hostname -I 2>/dev/null | awk '{print $1}' || true)"
fi

if [ -z "$IP_VAL" ] && command -v ifconfig >/dev/null 2>&1; then
  IP_VAL="$(ifconfig | awk '/inet / && $2 != "127.0.0.1" {print $2; exit}' || true)"
fi

[ -z "$IP_VAL" ] && IP_VAL="NOT DETECTED"

echo "[Auto-detected]"
echo "Hostname: $HOSTNAME_VAL"
echo "IP: $IP_VAL"
echo ""

printf "Enter username: "
read -r USERNAME

printf "Enter password: "
stty -echo
read -r PASSWORD
stty echo
printf "\n\n"

echo "Enter ports (leave blank if unknown):"
printf "ClearingHouse API Port: "
read -r CH_API
printf "ClearingHouse RPC Port: "
read -r CH_RPC
printf "Counterparty Port: "
read -r CP_PORT
printf "Wallet RPC Port: "
read -r WALLET_RPC

cat > "$OUTPUT_FILE" <<EOT
====================================
RitualMesh Node Configuration
====================================

[HOST INFO]
Hostname: $HOSTNAME_VAL
IP: $IP_VAL
Username: $USERNAME
Password: $PASSWORD

[PORTS]
ClearingHouse API: ${CH_API:-<set-me>}
ClearingHouse RPC: ${CH_RPC:-<set-me>}
Counterparty: ${CP_PORT:-<set-me>}
Wallet RPC: ${WALLET_RPC:-<set-me>}

[NOTES]
Primary Federated Node: YES
Host Role: Intel Mac
Secondary Host: M4 Mac (support / validation)

====================================
EOT

echo ""
echo "[✓] Saved to $OUTPUT_FILE"
echo "------------------------------------"
cat "$OUTPUT_FILE"

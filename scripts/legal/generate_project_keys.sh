#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
SECRETS_DIR="$ROOT/.secrets"
PUBLIC_DIR="$ROOT/legal/public"
SSH_DIR="$SECRETS_DIR/ssh"
GPG_DIR="$SECRETS_DIR/gpg"
IDENTITY_FILE="$ROOT/legal/KEY_IDENTITY_TEMPLATE.txt"

mkdir -p "$SSH_DIR" "$GPG_DIR" "$PUBLIC_DIR"

if [ ! -f "$IDENTITY_FILE" ]; then
  echo "[!] Missing $IDENTITY_FILE"
  exit 1
fi

COMMENT="VictorJoseCorral|RitualMesh|IanPatrickAhern|KristaLynnClark"

echo "[i] Generating SSH signing key..."
if command -v ssh-keygen >/dev/null 2>&1; then
  if [ ! -f "$SSH_DIR/ritualmesh_signing_ed25519" ]; then
    ssh-keygen -t ed25519 -C "$COMMENT" -f "$SSH_DIR/ritualmesh_signing_ed25519" -N ""
    cp "$SSH_DIR/ritualmesh_signing_ed25519.pub" "$PUBLIC_DIR/ritualmesh_signing_ed25519.pub"
    echo "[+] SSH key created."
  else
    echo "[i] SSH key already exists, not overwriting."
  fi
else
  echo "[!] ssh-keygen not found; skipped SSH key generation."
fi

echo "[i] Preparing optional GPG batch file..."
cat > "$GPG_DIR/ritualmesh_gpg_batch.txt" <<EOF
%no-protection
Key-Type: eddsa
Key-Curve: ed25519
Subkey-Type: ecdh
Subkey-Curve: cv25519
Name-Real: Victor Jose Corral
Name-Comment: RitualMesh legacy Ian Patrick Ahern / Krista Lynn Clark
Name-Email: victorjcorral@icloud.com
Expire-Date: 0
EOF

if command -v gpg >/dev/null 2>&1; then
  if ! gpg --list-secret-keys "Victor Jose Corral" >/dev/null 2>&1; then
    gpg --batch --generate-key "$GPG_DIR/ritualmesh_gpg_batch.txt"
    gpg --armor --export "Victor Jose Corral" > "$PUBLIC_DIR/ritualmesh_public.asc" || true
    echo "[+] GPG key generation attempted."
  else
    echo "[i] Matching GPG key appears to exist; not creating a duplicate."
  fi
else
  echo "[!] gpg not found; wrote batch template only."
fi

cat > "$PUBLIC_DIR/DEDICATION.txt" <<EOF
Project: RitualMesh
Creator: Victor Jose Corral
Legacy: Ian Patrick Ahern
Dedication: Krista Lynn Clark
Lineage: Maria Elena Corral
Inspiration: Seth Godin
EOF

echo
echo "[✓] Done."
echo "[i] Private material is stored under: $SECRETS_DIR"
echo "[i] Public material is stored under:  $PUBLIC_DIR"
echo "[!] Do NOT commit $SECRETS_DIR to git."

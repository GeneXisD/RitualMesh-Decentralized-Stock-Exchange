#!/usr/bin/env bash
set -euo pipefail

ISO_URL="https://releases.ubuntu.com/14.04/ubuntu-14.04.6-server-amd64.iso"
WORKROOT="${HOME}/VMs/ritualmesh-trusty-primary"
ISO_NAME="ubuntu-14.04.6-server-amd64.iso"
VM_NAME="RitualMesh-Trusty-Primary"
VM_DIR="${WORKROOT}/${VM_NAME}"
ISO_PATH="${WORKROOT}/${ISO_NAME}"
VMX_PATH="${VM_DIR}/${VM_NAME}.vmx"
CHECKSUM_FILE="${WORKROOT}/SHA256SUMS.generated.txt"
INSTALL_NOTE="${WORKROOT}/INSTALL-NOTES.txt"

mkdir -p "${WORKROOT}" "${VM_DIR}"

have_cmd() { command -v "$1" >/dev/null 2>&1; }

download_iso() {
  if have_cmd curl; then
    curl -L --fail --progress-bar -o "${ISO_PATH}" "${ISO_URL}"
  elif have_cmd wget; then
    wget -O "${ISO_PATH}" "${ISO_URL}"
  else
    echo "[!] Need curl or wget installed."
    exit 1
  fi
}

write_checksum() {
  if have_cmd shasum; then
    shasum -a 256 "${ISO_PATH}" > "${CHECKSUM_FILE}"
  elif have_cmd sha256sum; then
    sha256sum "${ISO_PATH}" > "${CHECKSUM_FILE}"
  fi
}

write_vmx() {
  cat > "${VMX_PATH}" <<EOF
.encoding = "UTF-8"
config.version = "8"
virtualHW.version = "20"
displayName = "${VM_NAME}"
guestOS = "ubuntu-64"
firmware = "bios"
numvcpus = "2"
cpuid.coresPerSocket = "2"
memsize = "4096"
sata0.present = "TRUE"
sata0:0.present = "TRUE"
sata0:0.fileName = "${VM_NAME}.vmdk"
sata0:1.present = "TRUE"
sata0:1.deviceType = "cdrom-image"
sata0:1.fileName = "${ISO_PATH}"
ethernet0.present = "TRUE"
ethernet0.connectionType = "nat"
ethernet0.virtualDev = "e1000e"
usb.present = "TRUE"
sound.present = "FALSE"
tools.syncTime = "TRUE"
rtc.startTime = "0"
disk.EnableUUID = "TRUE"
EOF
}

write_notes() {
  cat > "${INSTALL_NOTE}" <<EOF
VM name: ${VM_NAME}
ISO: ${ISO_PATH}
Suggested hostname: ritualmesh-primary
Suggested username: clearinghouse
Take snapshot immediately after install: clean-install
EOF
}

main() {
  [ -f "${ISO_PATH}" ] || download_iso
  write_checksum
  write_vmx
  write_notes
  echo "[+] Ready:"
  echo "    ISO: ${ISO_PATH}"
  echo "    VMX: ${VMX_PATH}"
  echo "    Notes: ${INSTALL_NOTE}"
}
main "$@"

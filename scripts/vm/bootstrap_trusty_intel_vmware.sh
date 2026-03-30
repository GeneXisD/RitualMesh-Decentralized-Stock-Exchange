#!/usr/bin/env bash
set -euo pipefail

# bootstrap_trusty_intel_vmware.sh
# Purpose:
#   Prepare an Intel Mac for an Ubuntu 14.04.6 (Trusty) VMware Fusion install.
#
# What it does:
#   1. Creates a workspace
#   2. Downloads the official Ubuntu 14.04.6 server AMD64 ISO
#   3. Writes checksum notes
#   4. Generates a VMware .vmx starter config
#   5. Generates an install checklist
#   6. Opens the VM folder / VMware if available
#
# What it does NOT do:
#   - It does not perform a fully unattended OS install
#   - It does not guarantee VMware Fusion is installed
#   - It does not patch Ubuntu 14.04 packages for you

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
  echo "[+] Downloading Ubuntu 14.04.6 server ISO..."
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
  echo "[+] Writing local checksum..."
  if have_cmd shasum; then
    shasum -a 256 "${ISO_PATH}" > "${CHECKSUM_FILE}"
  elif have_cmd sha256sum; then
    sha256sum "${ISO_PATH}" > "${CHECKSUM_FILE}"
  else
    echo "[!] No SHA256 tool found; skipping checksum file."
  fi
}

write_vmx() {
  echo "[+] Generating VMware starter config..."
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

  cat > "${VM_DIR}/${VM_NAME}.vmdk.notice.txt" <<EOF
Create the virtual disk in VMware Fusion:
- Name: ${VM_NAME}.vmdk
- Size: 60 GB recommended
- Split into multiple files: your choice
- Storage path: ${VM_DIR}
EOF
}

write_notes() {
  cat > "${INSTALL_NOTE}" <<EOF
RitualMesh Trusty install notes
================================

VM name:
${VM_NAME}

ISO:
${ISO_PATH}

Recommended VMware settings:
- Guest type: Ubuntu 64-bit
- CPU: 2 vCPU
- RAM: 4 GB minimum, 8 GB comfortable
- Disk: 60 GB
- Network: NAT first
- Firmware: BIOS
- Disable sound if not needed

Suggested first-boot actions after install:
1. Create a snapshot named: clean-install
2. Record hostname, users, passwords, and ports
3. Install open-vm-tools if desired
4. Freeze and document package choices before building ClearingHouse

Suggested hostnames:
- primary VM hostname: ritualmesh-trusty-primary

Important:
This VM is intended to be the authoritative federated node.
Do not treat the M4 Mac as the public federated endpoint unless explicitly promoted later.
EOF
}

open_targets() {
  echo "[+] Workspace ready at: ${WORKROOT}"
  open "${WORKROOT}" >/dev/null 2>&1 || true

  if [ -d "/Applications/VMware Fusion.app" ]; then
    echo "[+] VMware Fusion detected. Attempting to open the VMX..."
    open -a "VMware Fusion" "${VMX_PATH}" >/dev/null 2>&1 || true
  else
    echo "[i] VMware Fusion.app not found in /Applications."
    echo "[i] Open VMware manually, then open: ${VMX_PATH}"
  fi
}

main() {
  if [ -f "${ISO_PATH}" ]; then
    echo "[i] ISO already exists at ${ISO_PATH}; skipping download."
  else
    download_iso
  fi

  write_checksum
  write_vmx
  write_notes
  open_targets

  cat <<MSG

[✓] Done.

Next:
1. Open VMware Fusion
2. Open ${VMX_PATH}
3. Create/attach a 60 GB virtual disk if VMware asks
4. Boot from the ISO
5. Install Ubuntu 14.04.6
6. Take a snapshot immediately after install

Artifacts created:
- ISO: ${ISO_PATH}
- SHA256: ${CHECKSUM_FILE}
- VMX: ${VMX_PATH}
- Notes: ${INSTALL_NOTE}

MSG
}

main "$@"

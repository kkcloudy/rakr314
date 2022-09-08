#!/bin/bash -e

# Update os-release file
cat > "${ROOTFS_DIR}/etc/os-release" << EOL
PRETTY_NAME="RAK PiOS GNU/Linux (${RELEASE})"
NAME="RAK PiOS GNU/Linux"
VERSION_ID="${IMG_NAME}"
VERSION="${RELEASE}"
ID="rakpios"
ID_LIKE="debian"
HOME_URL="http://www.rakwireless.com/"
SUPPORT_URL="${PI_GEN_REPO}"
BUG_REPORT_URL="${PI_GEN_REPO}/issues"
COMMIT_SHA="${COMMIT_HASH:-$(git rev-parse --short HEAD)}"
COMMIT_DATE="${COMMIT_DATE:-$(git log -1 --format=%ad --date=short)}"
IMAGE_DATE="$(date +%Y-%m-%d)"
EOL

# Copy lora test tool
cp -r files/rak2287 "${ROOTFS_DIR}/home/$FIRST_USER_NAME/"
cp -r files/rak5146 "${ROOTFS_DIR}/home/$FIRST_USER_NAME/"

# Copy default wifi config
cp files/Hotspot.nmconnection "/${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
cp files/ethernet-eth0.nmconnection "/${ROOTFS_DIR}/etc/NetworkManager/system-connections/"
chmod 600 "/${ROOTFS_DIR}/etc/NetworkManager/system-connections/Hotspot.nmconnection"
chmod 600 "/${ROOTFS_DIR}/etc/NetworkManager/system-connections/ethernet-eth0.nmconnection"

#Update config.txt
cp files/config.txt "${ROOTFS_DIR}/boot/"

# Update MOTD
cp files/update-motd.d/* "${ROOTFS_DIR}/etc/update-motd.d/"



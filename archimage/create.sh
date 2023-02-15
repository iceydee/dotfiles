#!/bin/bash

if [ -z "${1}" ]; then
  echo "usage: ${0} [image file] ([size in bytes])"
  exit 1
fi

MKEXT4=$(which mkfs.ext4)
FALLOC=$(which fallocate)
if [ ! -f "${MKEXT4}" ]; then
  echo "error: mkfs.ext4 missing"
  exit 1
fi
if [ ! -f "${FALLOC}" ]; then
  echo "error: fallocate missing"
  exit 1
fi

IMGFILE="${1}"
SIZE="${2:-32212254720}"
MOUNTDIR="/mnt/arch"

if [ -f "${IMGFILE}" ]; then
  echo "error: ${IMGFILE} already exists"
  exit 1
fi

echo -n "Creating img file: "
"${FALLOC}" -l "${SIZE}" "${IMGFILE}"
echo "finished."

echo "Formatting with btrfs"
"${MKEXT4}" "${IMGFILE}"
echo "finished."

if [ ! -d "${MOUNTDIR}" ]; then
  mkdir -p "${MOUNTDIR}"
else
  sudo umount "${MOUNTDIR}"
fi

echo -n "Mounting volume: "
mkdir -p "${MOUNTDIR}"
sudo mount "${IMGFILE}" "${MOUNTDIR}"
echo "finished."

echo
echo "Running archbashstrap"
echo
echo

pushd "${HOME}/src/archbashstrap"
sudo MIRROR="https://ftp.lysator.liu.se/pub/archlinux" ./archbashstrap "${MOUNTDIR}"
popd

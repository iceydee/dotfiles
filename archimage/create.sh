#!/bin/bash

if [ -z "${1}" ]; then
  echo "usage: ${0} [image file] ([size in bytes])"
  exit 1
fi

MKBTRFS=$(which mkfs.btrfs)
FALLOC=$(which fallocate)
if [ ! -f "${MKBTRFS}" ]; then
  echo "error: mkfs.btrfs missing"
  exit 1
fi
if [ ! -f "${FALLOC}" ]; then
  echo "error: fallocate missing"
  exit 1
fi

IMGFILE="${1}"
SIZE="${2:-21474836480}"
MOUNTDIR="/mnt/arch"

if [ -f "${IMGFILE}" ]; then
  echo "error: ${IMGFILE} already exists"
  exit 1
fi

echo -n "Creating img file: "
"${FALLOC}" -l "${SIZE}" "${IMGFILE}"
echo "finished."

echo "Formatting with btrfs"
"${MKBTRFS}" "${IMGFILE}"
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
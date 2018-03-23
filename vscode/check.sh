#!/bin/bash

echo -n "Checking installed extensions."
./install.sh >/dev/null 2>&1
echo " Finished".

echo -n "Comparing."
code --list-extensions > /tmp/ext.new
echo " Finished."

DIFF=$(diff extensions /tmp/ext.new)

if [ -z "${DIFF}" ]; then
  echo
  echo "Nothing to update"
  exit 0
fi

echo
echo "Here's the extension list diff:"
diff -y extensions /tmp/ext.new
echo

echo -n "Update? [y/N] "
read A
if [ "${A}" == "y" ]; then
  mv /tmp/ext.new extensions
else
  rm /tmp/ext.new
fi


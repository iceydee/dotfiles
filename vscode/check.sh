#!/bin/bash

echo -n "Checking installed extensions."
./install.sh >/dev/null 2>&1
echo " Finished".

echo -n "Comparing."
code --list-extensions > /tmp/ext.new
echo " Finished."

diff extensions /tmp/ext.new

echo -n "Update? [y/N] "
read A
if [ "${A}" == "y" ]; then
  mv /tmp/ext.new extensions
else
  rm /tmp/ext.new
fi


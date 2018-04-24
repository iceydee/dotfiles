#!/bin/bash

sudo modprobe drm_kms_helper
sudo echo N > /sys/module/drm_kms_helper/parameters/poll
sudo echo "drm_kms_helper" > /etc/modprobe.d/mousefix.conf
sudo echo "drm_kms_helper" > /etc/modules-load.d/mousefix.conf
sudo echo "options drm_kms_helper poll=N" > /etc/modprobe.d/mousefix.conf

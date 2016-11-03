#!/bin/sh

diag_sudo="/etc/sudoers.d/diagnostic"

if [ -e ${diag_sudo} ]; then
    exit 1
else
    exit 0
fi

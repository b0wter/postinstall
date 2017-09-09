#!/usr/bin/env bash

#
# Determines os name, version and architecture.
#

function setOsAndVersion() {
    echo 'Determining OS type, version and architecture.'
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        ...
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        ...
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi

    #
    # --- Find Architecture ---
    #
    case $(uname -m) in
    x86_64)
        ARCH=x64  # or AMD64 or Intel64 or whatever
        ;;
    i*86)
        ARCH=x86  # or IA32 or Intel32 or whatever
        ;;
    *)
        # leave ARCH as-is
        ;;
    esac

    #
    # --- Find Hostname ---
    #
    HOSTNAME=$(hostname -s)

    echo "Probing finished: $HOSTNAME is running $OS $VERSION ($ARCH)."
}

# tests if the OS variable has been set and exits the script if it is not
#
function testOsHasBeenSet(){
    if [[ -z "$OS//" ]];
    then
        echo "OS not set, cannot set defines."
        exit 1
    fi
}

function displayArchitectureHint() {
    if [[ ($ARCH != "x64") && ($ARCH != "x86") ]];
    then
        echo "This script is only tested on x64 and x86 installs."
    fi
}
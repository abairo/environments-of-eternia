#!/bin/bash
os="$1"
os=${os,,}

if [[ "$os" == "debian" ]]; then
    echo "Installing Debian packages..."
    source ./debian.sh
    source ./ubuntu.sh
elif [[ "$os" == "ubuntu" ]]; then
    echo "Installing Ubuntu packages..."
    source ./ubuntu.sh
else
    echo "Unknown OS..."
fi
echo "End of installation"

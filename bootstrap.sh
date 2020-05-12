#!/bin/bash

sudo apt-get update
sudo apt-get -y dist-upgrade
if ! id "stack" >/dev/null 2>&1; then
	sudo useradd -s /bin/bash -d /opt/stack -m stack
	echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
fi

sudo -u stack -i /vagrant/setup.sh

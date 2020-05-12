#! /bin/bash

echo "I am $(whoami)"

if [ -d "devstack" ]; then
	# refresh git repo
	cd devstack
	git pull
else
	# clone git repo
	git clone https://opendev.org/openstack/devstack
	cd devstack
fi

export SECRET=secret
export HOSTIP=$(hostname -I)

cat <<EOF | tee local.conf
[[local|localrc]]
ADMIN_PASSWORD=$SECRET
DATABASE_PASSWORD=$SECRET
RABBIT_PASSWORD=$SECRET
SERVICE_PASSWORD=$SECRET
HOST_IP=$HOSTIP
EOF

./stack.sh


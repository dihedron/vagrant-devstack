# Vagrant recipe for DevStack

Vagrant recipe to create a VM running [DevStack](https://docs.openstack.org/devstack/latest/).

The setup process is in two steps:
1. a first script called `bootstrap.sh`, run as user `vagrant`, that updates the system, creates a new user called `stack` and then runs the next script as user `stack`;
2. a second script called `setup.sh`, run as user `stack`, that clones the DevStack GIT repo and then sets up the whole DevStack stuff (takes about 20 minutes to complete!).



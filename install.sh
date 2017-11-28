#!/bin/sh

WORK_DIR="$HOME/works"
ANSIBLE_DIR="$WORK_DIR/mac-os-x-setup"

# Make work directory
echo "Start make work directory"
mkdir -p "$WORK_DIR/private"

# Install xcode
echo "Start xcode install"
xcode-select --install

# Install homebrew
echo "Start homebrew install"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install python and ansible
echo "Start python and ansible install"
brew update
brew install python ansible

# Execute ansible playbook
echo "Start install packages"
git clone https://github.com/rabichan/mac-os-x-setup.git $ANSIBLE_DIR
ansible-playbook $ANSIBLE_DIR/site.yml -i $ANSIBLE_DIR/hosts

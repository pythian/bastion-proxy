#!/bin/bash

# Install ldap tools
export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< 'slapd/root_password password password'
debconf-set-selections <<< 'slapd/root_password_again password'
apt-get update
apt-get install slapd ldap-utils -y

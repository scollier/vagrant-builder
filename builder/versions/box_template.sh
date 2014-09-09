#!/bin/bash 

# to use this script, from its parent dir, run: ./versions/<script>.sh <target>
# you'll want to edit the below bash variables to match your use cases :)
# eg: ./versions/centos-7.sh upload
# to make your own base image and upload it to your own server somewhere.

export VERSION='fedora-20'		# pick from the output of virt-builder -l
export DISK_SIZE='15'
export POSTFIX=''
export SERVER=''			# connect over ssh (add your public key first)
export REMOTE_PATH=''			# make a $VERSION directory in this dir
export REPOS=''  			# add extra repos to the base image
export IMAGES=''		# list of docker images to include
# export ENABLE_DOCKER="--run-command 'systemctl enable docker'"
export DEFAULT_PACKAGES='bash-completion moreutils puppet \
rsync nfs-utils sudo openssh-server  \
openssh-clients screen git wget  \
file man tree nmap tcpdump htop lsof  \
telnet mlocate bind-utils koan  \
iftop yum-utils nc psmisc puppet'
export FEDORA_EXTRAS='docker-io'
# export RHEL-EXTRAS='docker vim-enhanced epel-release-7-0.2.noarch.rpm puppetlabs-release-el-7.noarch.rpm'
# export CENTOS-EXTRAS='docker vim-enhanced'

make VERSION=$VERSION POSTFIX=$POSTFIX SERVER=$SERVER REMOTE_PATH=$REMOTE_PATH IMAGES="$IMAGES" EXTRAS="$EXTRAS" $@

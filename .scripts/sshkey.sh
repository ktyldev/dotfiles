#!/usr/bin/env bash
#https://stackoverflow.com/questions/48248144/how-do-i-generate-new-ssh-key-for-my-new-gitlab-account

#   exit early if args no good
if (( $# != 4)); then
    echo -e "usage:"
    echo -e "\tsshkey.sh <hostname> <email> <password> <key file>"
    exit 1
fi

#   parse args
hostname=$1
email=$2
pass=$3
keyname=$4

sshconfig="$HOME/.ssh/config"
keypath="$HOME/.ssh/$keyname"

#   TODO: add a flag
#   TODO: ask user if they want to delete it
if test -f $keypath
then
    echo "$keypath already exists."
    echo "either delete it or use a different key file name."
    exit 1
fi

ssh-keygen -t rsa -C "$email" -P "$pass" -q -f $keypath

#   create an entry in .ssh/config to be able to use the key immediately
cfgstr="\nHost $hostname\n" 
cfgstr+="\tHostName $hostname\n"
cfgstr+="\tUser git\n"
cfgstr+="\tPreferredAuthentications publickey\n"
cfgstr+="\tIdentityFile $keypath\n"

echo "adding entry to $sshconfig..."
echo -e $cfgstr >> $sshconfig

echo "key created at $keypath"
exit 0

#!/bin/bash

HOST=$1

ssh-keygen -R $HOST
ssh-keygen -R $(grep -e "[[:space:]]$HOST" /etc/hosts | grep -v \# | awk '{ print $1}')
ssh bastion1.lax "ssh-keygen -R $HOST; ssh-keygen -R \$(grep -e '\s$HOST' /etc/hosts | grep -v \# | awk '{ print \$1}')"
ssh bastion1.sjc "ssh-keygen -R $HOST; ssh-keygen -R \$(grep -e '\s$HOST' /etc/hosts | grep -v \# | awk '{ print \$1}')"
ssh bastion1.rno "ssh-keygen -R $HOST; ssh-keygen -R \$(grep -e '\s$HOST' /etc/hosts | grep -v \# | awk '{ print \$1}')"

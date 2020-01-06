#!/bin/bash
#Author: Siddharth Lakhani
#Description: This script used to keep only last 2 modified files and delete rest.

keep=2 #set this to how many files want to keep
discard=$(expr $keep - $(cd /home/ubuntu/dir; ls|wc -l))
if [ $discard -lt 0 ]; then
  cd /home/ubuntu/dir
  ls -Bt|tail $discard|tr '\n' '\0'|xargs -0 printf "%b\0"|xargs -0 rm --
fi
#!/bin/sh

virsh destroy centos68
virsh undefine centos68
rm -rf /vm-image/centos68.img

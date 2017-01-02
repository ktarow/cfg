cd $HOME/git/cfg/ks

virt-install \
--name $VMNAME \
--network=bridge:br0 \
--disk path=$VMPATH/$VMNAME,size=50 \
--ram 4096 \
--vcpus 2 \
--graphics none \
--location http://ftp.iij.ad.jp/pub/linux/centos/6.8/os/x86_64 \
--initrd-inject=./centos6-ks.cfg \
--extra-args "ks=file:centos6-ks.cfg console=tty0 console=ttyS0,115200"

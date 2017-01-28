cd $HOME/git/cfg/ks

virt-install \
--name $VMNAME \
--network=bridge:br0 \
--disk path=$VMPATH/$VMNAME,size=50 \
--ram 4096 \
--vcpus 2 \
--graphics none \
--location http://ftp.iij.ad.jp/pub/linux/centos/7.3.1611/os/x86_64/ \
--initrd-inject=./centos7-ks.cfg \
--extra-args "ks=file:centos7-ks.cfg console=tty0 console=ttyS0,115200"

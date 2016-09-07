virt-install \
--name centos68 \
--network=bridge:br0 \
--disk path=/vm-image/centos68.img,size=100 \
--ram 8192 \
--vcpus 2 \
--graphics none \
--location http://ftp.iij.ad.jp/pub/linux/centos/6.8/os/x86_64 \
--initrd-inject=./git/cfg/centos6-ks.cfg \
--extra-args "ks=file:centos6-ks.cfg console=tty0 console=ttyS0,115200"

virt-install \
--name $VMNAME \
--network=bridge:br0 \
--disk path=$VMPATH/$VMNAME,size=50 \
--ram 2048 \
--vcpus 2 \
--graphics none \
--location http://ftp.riken.jp/Linux/ubuntu/dists/xenial/main/installer-amd64 \
--initrd-inject=./preseed.cfg \
--extra-args "console=tty0 console=ttyS0,115200"

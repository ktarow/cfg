virt-install \
--name ubuntu \
--network=bridge:br0 \
--disk path=/vm-image/test.img,size=50 \
--ram 2048 \
--vcpus 2 \
--graphics none \
--location http://ftp.riken.jp/Linux/ubuntu/dists/xenial/main/installer-amd64 \
--initrd-inject=./git/cfg/preseed.cfg \
--extra-args "console=tty0 console=ttyS0,115200"

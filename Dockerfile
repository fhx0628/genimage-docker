FROM centos:7
MAINTAINER hxfei.dev@gmail.com
ENV container docker
RUN yum install -y libconfuse-devel mtools wget automake libtool gcc-c++ make dosfstools
RUN yum install -y https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libconfuse-2.7-7.el7.x86_64.rpm
RUN yum install -y https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libconfuse-devel-2.7-7.el7.x86_64.rpm
RUN yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/uuid-devel-1.6.2-26.el7.x86_64.rpm
RUN wget https://cdn.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz && tar -xf util-linux-2.31.1.tar.xz
RUN cd util-linux-2.31.1 && ./configure --enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-dependency-tracking  --without-python --enable-libblkid --enable-libmount --enable-libuuid --without-ncurses --without-ncursesw --without-tinfo --disable-makeinstall-chown --disable-agetty --disable-chfn-chsh --disable-chmem --disable-login --disable-lslogins --disable-mesg --disable-more --disable-newgrp --disable-nologin --disable-nsenter --disable-pg --disable-rfkill --disable-schedutils --disable-setpriv --disable-setterm --disable-su --disable-sulogin --disable-tunelp --disable-ul --disable-unshare --disable-uuidd --disable-vipw --disable-wall --disable-wdctl --disable-write --disable-zramctl && make -j5 && make install && cd .. && rm -rf util-linux-2.31.1*
RUN wget https://github.com/pengutronix/genimage/releases/download/v9/genimage-9.tar.xz && tar -xf genimage-9.tar.xz 
RUN cd genimage-9 && ./configure --enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-dependency-tracking && make -j5 && make install && cd .. && rm -rf genimage-9*
RUN wget https://cdn.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.xz && tar -xf e2fsprogs-1.43.9.tar.xz
RUN cd e2fsprogs-1.43.9 && PKG_CONFIG_PATH=/usr/lib/pkgconfig/ ./configure --enable-shared --disable-static --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-dependency-tracking  --disable-defrag --disable-e2initrd-helper --disable-fuse2fs --disable-libblkid --disable-libuuid --enable-symlink-install --disable-testio-debug && make -j5 && make install && cd .. && rm -rf e2fsprogs-1.43.9*
CMD ["/usr/sbin/init"]

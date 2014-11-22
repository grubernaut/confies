# Archlinux from base/archlinux with omnibus chef installed from AUR via yaourt

FROM base/archlinux

ENV CHEF_VERSION 11.16.4

# Basic Docker Things
RUN pacman -Syy --noprogressbar
RUN pacman -Syu --noconfirm --noprogressbar
RUN pacman -S --noprogressbar --noconfirm --needed wget base base-devel git openssh sudo curl
RUN ssh-keygen -A -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -A -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN useradd -d /home/kitchen -m -s /bin/bash kitchen
RUN echo kitchen:kitchen | chpasswd
RUN echo 'kitchen ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /root/build
WORKDIR /root/build

# Install Package Query
RUN wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
RUN tar -xzvf package-query.tar.gz
RUN (cd package-query; makepkg -s -f --asroot --noconfirm --noprogressbar)
RUN pacman -U --noconfirm ./package-query/package-query-*.pkg.tar.xz

# Install yaourt
RUN wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
RUN tar -xzvf yaourt.tar.gz
RUN (cd yaourt; makepkg -s -f --asroot --noconfirm --noprogressbar)
RUN pacman -U --noconfirm ./yaourt/yaourt-*.pkg.tar.xz

# Install Chef-DK
RUN yaourt -S --noconfirm chef-dk

# Trick chef-dk into being omnibus-chef
RUN mkdir -p /opt/chef/bin/
RUN ln /opt/chefdk/bin/* /opt/chef/bin/

# Cleanup
RUN rm -f /var/lib/pacman/db.lck
RUN rm -fr /root/build


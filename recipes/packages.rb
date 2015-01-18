#
# Cookbook Name:: confies
# Recipe:: packages
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

# Would love to have this be alphabetical, but dependencies win out
packages = [
  "archey3-git",
  "awesome",
  "chef-dk",
  "chruby",
  "dropbox",
  "dnsutils",
  "docker",
  "dropbox-cli",
  "ec2-ami-tools",
  "ec2-api-tools",
  "emacs",
  "escrotum-git",
  "firefox",
  "fortune-mod",
  "google-chrome",
  "gpicview",
  "hddtemp",
  "hipchat",
  "htop",
  "icedtea-web",
  "jdk8-openjdk",
  "libcanberra",
  "mesa-demos",
  "mimeo",
  "mlocate",
  "mutt-sidebar",
  "offlineimap",
  "percona-server",
  "perl-dbd-mysql",
  "python2-pip",
  "rsync",
  "ruby-shadow",
  "rxvt-unicode",
  "spotify",
  "sublime-text-dev",
  "tmux",
  "transmission-gtk",
  "ttf-mac-fonts",
  "ttf-meslo",
  "ubuntu-sounds",
  "urxvt-clipboard",
  "urxvt-tabbedex",
  "xfce4-terminal",
  "vagrant",
  "vlc",
  "vim",
  "virtualbox-bin",
  "whois",
  "wget",
  "xorg-server",
  "zsh"
]

packages.each do |pkg|
  pacman_yaourt pkg do
    action :install
  end
end

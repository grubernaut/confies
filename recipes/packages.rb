#
# Cookbook Name:: confies
# Recipe:: packages
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

packages = [
  "zsh",
  "vim",
  "rsync",
  "tmux",
  "mlocate",
  "htop",
  "awesome",
  "hddtemp",
  "scrot",
  "rxvt-unicode",
  "xorg-server",
  "archey",
  "spotify",
  "hipchat",
  "ttf-mac-fonts",
  "urxvt-clipboard",
  "urxvt-tabbedex",
  "chef-dk",
  "sublime-text-dev",
  "google-chrome",
  "atom-editor",
  "emacs",
  "ruby-shadow",
  "dropbox"
]

packages.each do |pkg|
  pacman_yaourt pkg do
    action :install
  end
end

#
# Cookbook Name:: confies
# Recipe:: dots
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

# Setup Config Directory
dirs = [
  "/home/mufasa/",
  "/home/mufasa/.config",
  "/home/mufasa/.config/systemd",
  "/home/mufasa/.config/systemd/user"
]

dirs.each do |path|
  directory path do
    owner 'mufasa'
    group 'mufasa'
    mode '0755'
  end
end

# Install systemd emacs service
cookbook_file "emacs-service" do
  path "/home/mufasa/.config/systemd/user/emacs.service"
  action :create
  mode "0644"
  owner 'mufasa'
  group 'mufasa'
end

# Install Awesome Config
git "/home/mufasa/.config/awesome" do
  repository "git://github.com/grubernaut/awesome-copycats"
  reference "master"
  action :sync
  user "mufasa"
  group "mufasa"
end

# Install oh-my-zsh
git "/home/mufasa/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh"
  reference "master"
  action :sync
  user "mufasa"
  group "mufasa"
end

# Install Emacs Config
git "/home/mufasa/.emacs.d" do
  repository "git://github.com/grubernaut/emacs.d"
  reference "master"
  action :sync
  user "mufasa"
  group "mufasa"
end

files = {
  "dot-xinitrc" => "/home/mufasa/.xinitrc",
  "dot-xmodmap" => "/home/mufasa/.Xmodmap",
  "dot-xresources" => "/home/mufasa/.Xresources",
  "dot-aliases" => "/home/mufasa/.zshaliases",
  "dot-zshrc"      => "/home/mufasa/.zshrc"
}

files.each do |file, path|
  cookbook_file "#{file}" do
    path "#{path}"
    action :create
    mode "0644"
    owner "mufasa"
    group "mufasa"
  end
end

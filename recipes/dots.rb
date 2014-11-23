#
# Cookbook Name:: confies
# Recipe:: dots
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

# Loop Through All Users for These Dots

admins = data_bag('users')

admins.each do |login|
  admin = data_bag_item('users', login)

  # Setup Config Directory
  dirs = [
    admin['home'],
    "#{admin['home']}/.config",
    "#{admin['home']}/.config/systemd",
    "#{admin['home']}/.config/systemd/user"
  ]

  dirs.each do |path|
    directory path do
      owner admin['id']
      group admin['id']
      mode '0755'
    end
  end

  # Install systemd emacs service
  cookbook_file "emacs-service" do
    path "#{admin['home']}/.config/systemd/user/emacs.service"
    action :create
    mode "0644"
    owner admin['id']
    group admin['id']
  end

  # Install Awesome Config
  git "#{admin['home']}/.config/awesome" do
    repository "git://github.com/grubernaut/awesome-copycats"
    reference "master"
    action :sync
    user admin['id']
    group admin['id']
  end

  # Install oh-my-zsh
  git "#{admin['home']}/.oh-my-zsh" do
    repository "git://github.com/robbyrussell/oh-my-zsh"
    reference "master"
    action :sync
    user admin['id']
    group admin['id']
  end

  # Install Emacs Config
  git "#{admin['home']}/.emacs.d" do
    repository "git://github.com/grubernaut/emacs.d"
    reference "master"
    action :sync
    user admin['id']
    group admin['id']
  end

  files = {
    "dot-xinitrc" => "#{admin['home']}/.xinitrc",
    "dot-xmodmap" => "#{admin['home']}/.Xmodmap",
    "dot-xresources" => "#{admin['home']}/.Xresources",
    "dot-aliases" => "#{admin['home']}/.zshaliases",
    "dot-zshrc"      => "#{admin['home']}/.zshrc"
  }

  files.each do |file, path|
    cookbook_file file do
      path path
      action :create
      mode "0644"
      owner admin['id']
      group admin['id']
    end
  end
end

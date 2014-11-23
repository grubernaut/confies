#
# Cookbook Name:: confies
# Recipe:: user
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

user "jake" do
  action :create
  supports :manage_home => true
  comment "Jake Champlin"
  home "/home/jake"
  shell "/bin/zsh"
  password "$1$tbTRVpAx$MFSCA6xGs0uPsNNVliTr10"
end

group "jake" do
  action :create
  members "jake"
end

# Wheel, and docker groups are managed in the "user" recipe

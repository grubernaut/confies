#
# Cookbook Name:: confies
# Recipe:: user
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

user "mufasa" do
  action :create
  supports :manage_home => true
  comment "Jake Champlin"
  home "/home/mufasa"
  shell "/bin/zsh"
  password "$1$tbTRVpAx$MFSCA6xGs0uPsNNVliTr10"
end

group "mufasa" do
  action :create
  members "mufasa"
end

group "wheel" do
  action :create
  members "mufasa"
end

group "docker" do
  action :create
  members "mufasa"
end

sudo 'wheel' do
  group "%wheel"
  nopasswd true
end

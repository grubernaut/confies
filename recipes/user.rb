#
# Cookbook Name:: confies
# Recipe:: user
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

users_manage "wheel" do
  action :create
end

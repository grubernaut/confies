#
# Cookbook Name:: confies
# Recipe:: default
#
# Copyright (C) 2014 jake
#
# All rights reserved - Do Not Redistribute
#

# Include Pacman
include_recipe "pacman::default"

# Include Packages to be installed
include_recipe "confies::packages"

# Add Users to system
include_recipe "confies::user"

# Include Config Files Recipe
include_recipe "confies::dots"

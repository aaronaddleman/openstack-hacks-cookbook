#
# Cookbook Name:: openstack-hacks
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'mariadb' do
  description "MariaDB"
  baseurl "http://yum.mariadb.org/10.0/centos6-amd64"
  gpgkey 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'
  action :create
end

group 'mysql' do
  action :create
end

user 'mysql' do
  uid 500
  gid 'mysql'
  home '/home/mysql'
  shell '/bin/bash'
  password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
end

yum install http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm
yum install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
mkdir -p /var/log/ironic

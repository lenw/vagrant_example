# --- Install packages we need ---

directory '/var/chef-package-cache' do
  owner "root"
  group "root"
  mode "0755"
  #action :create
end.run_action(:create)

cookbook_file "/var/chef-package-cache/nginx_1.2.2-1~lucid_i386.deb" do
    source "nginx_1.2.2-1~lucid_i386.deb"
    owner "root"
    group "root"
    mode "0444"
end


dpkg_package 'nginx' do
	package_name 'nginx'
	source '/var/chef-package-cache/nginx_1.2.2-1~lucid_i386.deb'
	action :install
end


cookbook_file "/etc/nginx/nginx.conf" do
    source "nginx.conf"
    owner "root"
    group "root"
    mode "0444"
end

service "nginx" do
  action :restart
end
#execute "update package index" do
  #command "apt-get update"
  #ignore_failure true
  #action :nothing
#end.run_action(:run)

#package 'nginx'

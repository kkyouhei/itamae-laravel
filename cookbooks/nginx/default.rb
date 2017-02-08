package "nginx" do
  action :install
end

NGINX_DEFAULT_CONF = "/etc/nginx/conf.d/default.conf"
template NGINX_DEFAULT_CONF do
  owner "root"
  group "root"
  mode "644"
  source "./templates/etc/nginx/conf.d/default.conf.erb"
  notifies :restart, "service[nginx]"
end

service "nginx" do
  action [:enable, :start]
end

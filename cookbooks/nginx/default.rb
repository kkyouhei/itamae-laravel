package "nginx" do
  action :install
end

NGINX_LOG_ROTATE = "/etc/logrotate.d/nginx"
remote_file NGINX_LOG_ROTATE do
  owner "root"
  group "root"
  mode "755"
  source "./files/etc/logrotate.d/nginx"
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

package 'php' do
  options '--enablerepo=remi,remi-php71'
  action :install
end

package 'php-fpm php-mcrypt php-xml php-mbstring php-pdo php-mysqlnd php-tokenizer php-dom' do
  options '--enablerepo=remi,remi-php71'
  action :install
end

# php-fpm
PHP_FPM_WWW_CONF = "/etc/php-fpm.d/www.conf"
remote_file PHP_FPM_WWW_CONF do
  source "./files/etc/php-fpm.d/www.conf"
end

PHP_FPM_LOG_ROTATE = "/etc/logrotate.d/php-fpm"
remote_file PHP_FPM_LOG_ROTATE do
  owner "root"
  group "root"
  mode "755"
  source "./files/etc/logrotate.d/php-fpm"
end

service "php-fpm" do
  action [:enable, :start]
end

# composer
execute "composer install" do
  command "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"
  not_if "test $(which /usr/local/bin/composer)"
end

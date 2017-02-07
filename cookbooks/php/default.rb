package 'php' do
  options '--enablerepo=remi,remi-php71'
  action :install
end

package 'php-fpm php-mcrypt php-xml php-mbstring php-pdo php-mysqlnd php-tokenizer php-dom' do
  options '--enablerepo=remi,remi-php71'
  action :install
end

service "php-fpm" do
  action [:enable, :start]
end

# composer
execute "composer install" do
  command "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"
  not_if "test $(which /usr/local/bin/composer)"
end

# itamae-laravel
laravel recipe (php7.1 php-fpm7.1 nginx mysql-client)

# Usage

## run itamae command
```
$ git clone git@github.com:kkyouhei/itamae-laravel
$ cd itamae-laravel
$ bundle install --path vendor/bundler
$ bundle exec itamae ssh -h 192.168.1.1 -u vagrant roles/web.rb
```

## laravel install using composer

```
$ vagrant ssh
$ cd /var/www
$ sudo chown vagrant . && sudo chgrp vagrant .
$ composer create-project --prefer-dist laravel/laravel dev.example.com
$ cd dev.example.com
$ sudo chmod 777 -R storage && sudo chmod 777 -R bootstrap/cache
```

access vagrant ip via your browser 

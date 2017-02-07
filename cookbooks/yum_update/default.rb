# recipes/yum_update.rb
execute "yum clean all"
execute "yum update -y"

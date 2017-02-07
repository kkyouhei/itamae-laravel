NDENV_DIR = "/usr/local/ndenv"
NDENV_SCRIPT = "/etc/profile.d/ndenv.sh"

git NDENV_DIR do
  repository "git://github.com/riywo/ndenv.git"
end

execute "mkdir #{NDENV_DIR}/shims #{NDENV_DIR}/versions"

remote_file NDENV_SCRIPT do
  source "./files/etc/profile.d/ndenv.sh"
end

execute "set owner and mode for #{NDENV_SCRIPT} " do
  command "chown root: #{NDENV_SCRIPT}; chmod 644 #{NDENV_SCRIPT}"
  user "root"
end

execute "mkdir #{NDENV_DIR}/plugins" do
  not_if "test -d #{NDENV_DIR}/plugins"
end

git "#{NDENV_DIR}/plugins/node-build" do
  repository "git://github.com/riywo/node-build.git"
end

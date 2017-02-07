NDENV_DIR = "/usr/local/ndenv"
NDENV_SCRIPT = "/etc/profile.d/ndenv.sh"

execute "ndenv install v7.5.0" do
  command "source #{NDENV_SCRIPT}; ndenv install v7.5.0"
end

execute "set global ndenv v7.5.0" do
  command "source #{NDENV_SCRIPT}; ndenv global v7.5.0; ndenv rehash"
end

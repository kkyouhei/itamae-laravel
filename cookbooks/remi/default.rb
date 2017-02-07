package 'epel-release' do
    action :install
end

package "http://rpms.famillecollet.com/enterprise/remi-release-#{node[:platform_version][0]}.rpm" do
    not_if 'rpm -q remi-release'
end

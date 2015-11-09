['/usr/local', '/opt/homebrew-cask/Caskroom'].each do |dir|
  directory dir do
    owner node['user']
  end
end

include_recipe 'homebrew'
include_recipe 'homebrew::cask'

node['osx_bootstrap']['packages'].each do |pkg|
  package pkg
end

node['osx_bootstrap']['cask_packages'].each do |pkg|
  homebrew_cask pkg
end

link "/Users/#{node['user']}/icloud" do
  to "/Users/#{node['user']}/Library/Mobile\ Documents"
end

include_recipe 'osx_bootstrap::seil'

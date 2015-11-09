['/usr/local', '/opt/homebrew-cask/Caskroom'].each do |dir|
  directory dir do
    owner ENV['SUDO_USER'] || ENV['USER']
  end
end

include_recipe 'homebrew'
include_recipe 'homebrew::cask'

package 'git'

homebrew_cask 'atom'
homebrew_cask 'iterm2'
homebrew_cask 'vagrant'
homebrew_cask 'virtualbox'

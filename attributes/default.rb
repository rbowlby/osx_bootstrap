default['chefdk_bootstrap']['atom']['source_url'] = 'https://atom.io/download/mac'

# common things to install
default['chefdk_bootstrap']['package'].tap do |install|
  install['atom'] = true
  install['virtualbox'] = true
  install['vagrant'] = true
  install['git'] = true
  install['iterm2'] = true
end

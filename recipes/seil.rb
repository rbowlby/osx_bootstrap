# installs, sets capslock to esc, adds to startup

homebrew_cask 'seil'

osascript = "/usr/bin/osascript"

# disable normal capslock key within globalpreferences
cookbook_file "disable_capslock.scpt" do
  path "#{Chef::Config[:file_cache_path]}/disable_capslock.scpt"
  action :create
end

# sys pref => keyboard => modifier keys => capslock => noaction
# no known way to tell if ran, add hacky sentinel :(
execute "set_capslock_noaction" do
  command "#{osascript} #{Chef::Config[:file_cache_path]}/disable_capslock.scpt"
  not_if { File.exist? "#{Chef::Config[:file_cache_path]}/set_capslock_noaction_ran" }
  notifies :create, "file[set_capslock_noaction_ran]"
end

file "set_capslock_noaction_ran" do
  path "#{Chef::Config[:file_cache_path]}/set_capslock_noaction_ran"
  action :nothing
end

seil_app = "/Applications/Seil.app"
seil_bin = "/Applications/Seil.app/Contents/Library/bin/seil"

# start seil app if not running
execute "/usr/bin/open #{seil_app}" do
  action :run
  not_if "pgrep seil &>/dev/null"
end

# disable normal capslock key functionality
execute "#{seil_bin} set enable_capslock 1" do
  action :run
  not_if "#{seil_bin} export | grep -q 'set enable_capslock 1'"
  notifies :run, "execute[seil_relaunch]"
end

# set capslock to escape
execute "#{seil_bin} set keycode_capslock 53" do
  action :run
  not_if "#{seil_bin} export | grep -q 'set keycode_capslock 53'"
  notifies :run, "execute[seil_relaunch]"
end

execute "seil_relaunch" do
  command "#{seil_bin} relaunch"
  action :nothing
end

# add seil to startup
add_cmd = "-e 'tell application \"System Events\" to make new login item at end with properties {path:\"#{seil_app}\", name:\"Seil\", hidden:true} '"
if_cmd = "-e 'tell application \"System Events\" to get the name of every login item' | grep -q Seil"

execute "seil_on_login" do
  action :run
  command "#{osascript} #{add_cmd}"
  not_if "#{osascript} #{if_cmd}"
end

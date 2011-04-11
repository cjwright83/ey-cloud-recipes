#
# Cookbook Name:: jruby
# Recipe:: default
#
remote_file "/tmp/jruby-bin-1.6.0.tar.gz" do
  not_if "test -d /usr/lib/jruby-1.6.0"
  source "https://s3.amazonaws.com/engineyard-third-party-tools/jruby-bin-1.6.0.tar.gz"
end

execute "tar" do
  not_if "test -d /usr/lib/jruby-1.6.0"
  user "deploy"
  command "sudo tar -C /usr/lib -xvf /tmp/jruby-bin-1.6.0.tar.gz"
  action :run
end

execute "symbolic link" do
  not_if "test -f /usr/bin/jruby"
  user "deploy"
  command "sudo ln -s /usr/lib/jruby-1.6.0/bin/jruby /usr/bin/jruby"
end

execute "install rails" do
  command "sudo jruby -S gem install rails -v=2.3.11"
end

execute "gem install activerecord-jdbcmysql-adapter" do
  command "sudo jruby -S gem install activerecord-jdbcmysql-adapter -v=1.1.1"
end

execute "gem install bunny" do
  command "sudo jruby -S gem install bunny -v=0.6.0"
end

execute "gem install json" do
  command "sudo jruby -S gem install json -v=1.5.1"
end

remote_file "/tmp/apache-tomcat-7.0.11.tar.gz" do
 not_if "test -d /usr/lib/apache-tomcat-7.0.11"
 source "https://s3.amazonaws.com/engineyard-third-party-tools/apache-tomcat-7.0.11.tar.gz"
end

execute "tar" do
 not_if "test -d /usr/lib/apache-tomcat-7.0.11"
 user "deploy"
 command "sudo tar -C /usr/lib -xvf /tmp/apache-tomcat-7.0.11.tar.gz"
 action :run
end

=begin

execute "warble" do
   user "deploy"
  command "sudo warble"
  action :run
end

execute "copy war file" do
  user "deploy"
  command "sudo cp /data/insurance_claims/current/insurance-exchange.war /usr/lib/apache-tomcat-7.0.11/webapps"
  action :run
end

execute "start tomcat" do
  user "deploy"
  command "sudo /usr/lib/apache-tomcat-7.0.11/bin/startup.sh"
  action :run
end

execute "cd into app tomcat directory" do
  user "deploy"
  command "cd /usr/lib/apache-tomcat-7.0.11/webapps/insurance-exchange/WEB-INF"
  action :run
end

execute "stop tomcat" do
  user "deploy"
  command "sudo /usr/lib/apache-tomcat-7.0.11/bin/shutdown.sh"
  action :run
end

execute "start tomcat" do
  user "deploy"
  command "sudo /usr/lib/apache-tomcat-7.0.11/bin/startup.sh"
  action :run
end

=end


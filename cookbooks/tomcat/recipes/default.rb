package "tomcat" do
  version "7.0.11"
  action :install
end

=begin

remote_file "/tmp/jruby-bin-1.6.0.tar.gz" do
 source "http://jruby.org.s3.amazonaws.com/downloads/1.6.0/jruby-bin-1.6.0.tar.gz"
end
=end

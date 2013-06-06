include_recipe "tomcat::service"

service "tomcat" do
  action :stop
end
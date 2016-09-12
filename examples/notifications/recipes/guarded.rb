template '/tmp/notifying_resource' do
  only_if { 1 == 2 }
  notifies :restart, 'service[receiving_resource]'
end

service 'receiving_resource' do
  action :nothing
end

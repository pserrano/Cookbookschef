service 'tomcat' do
  service_name value_for_platform(
    ['centos','redhat','fedora','amazon','debian','ubuntu'] => {'default' => 'tomcat6'}
  )

  ['restart'].each do |srv_cmd|
    send("#{srv_cmd}_command", value_for_platform(
        ['centos','redhat','fedora','amazon'] => {
          'default' => "/sbin/service tomcat6 #{srv_cmd} && sleep 1"
        },
        ['debian','ubuntu'] => {
          'default' => "/etc/init.d/tomcat6 #{srv_cmd} && sleep 1"
        }
      )
    )
  end

  supports value_for_platform(
    'debian' => {
      '4.0' => [:restart],
      'default' => [:restart]
    },
    'ubuntu' => { 'default' => [:restart] },
    ['centos','redhat','fedora','amazon'] => { 'default' => [:restart] },
    'default' => { 'default' => [:restart] }
  )

  action :nothing
end

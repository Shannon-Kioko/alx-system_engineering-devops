# Automate conofiguration of Nginx HTTP response custom header
# The name of custom HTTP header must be X-Served-By and value hostname of the server.

exec {'update':
  command => '/usr/bin/apt-get update',
}
-> package {'nginx':
  ensure => 'present',
}
-> file_line { 'http_header':
  path  => '/etc/nginx/nginx.conf',
  line  => "http {\n\tadd_header X-Served-By \"${hostname}\";",
  match => 'http {',
}
-> exec {'start':
  command => '/usr/sbin/service nginx start',
}

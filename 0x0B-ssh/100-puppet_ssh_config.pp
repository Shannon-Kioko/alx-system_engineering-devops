# Define the SSH client configuration file path
$ssh_config_path = '/home/ubuntu/.ssh/config'

# Ensure the SSH client configuration directory exists
file { '/home/ubuntu/.ssh':
  ensure => 'directory',
}

# Manage the SSH client configuration file
file { $ssh_config_path:
  ensure  => 'file',
  content => "Host your_server\n  HostName 54.237.207.206\n  User ubuntu\n  IdentityFile ~/.ssh/school\n  PasswordAuthentication no\n",
}

# Notify SSH to reload its configuration
exec { 'reload_ssh_config':
  command     => 'service ssh reload',
  refreshonly => true,
}


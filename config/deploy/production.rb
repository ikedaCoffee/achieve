server '52.69.25.35', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/kohei/.ssh/id_rsa'

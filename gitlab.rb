external_url '192.168.2.100'
gitlab_rails['gitlab_shell_ssh_port'] = 22
letsencrypt['enabled'] = false
nginx['redirect_http_to_https'] = true
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')

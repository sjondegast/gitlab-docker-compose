# gitlab-docker-compose

## getting started

1. create gitlab directory & cd into it
2. git clone https://github.com/sjondegast/gitlab-docker-compose.git .
3. run docker-compose config to check config

## Changelog

1. removed root_password.txt, removed set auto add root password secret from docker-compose.yaml and gitlab.rb file
2. changed volume mount host, moved path to .env file.

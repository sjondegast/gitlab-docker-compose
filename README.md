# gitlab-docker-compose

## 1. getting started

1. create gitlab directory & cd into it
2. export the root folder of the gitlab project

   ```bash
   export GITLAB_HOME=/path/to/host/mount/gitlab_project
   ```

3. Set folder/file permisions correctly
4. Clone repository docker project

   - use a dot to clone the repository to clone the folder content only

   ```bash
   git clone https://github.com/sjondegast/gitlab-docker-compose.git .
   ```

5. Adjust the environmental variables to you're liking
6. Run docker-compose config to check config

   ```bash
   docker-compose config
   ```

7. If config passed run docker-compose up -d (-d for detached mode)

   ```bash
   docker-compose up -d
   ```

8. Check log output gitlab container

   ```bash
   docker logs -f gitlab
   ```

## 2. Configuration Options

### Set up Host mounted volumes

Used to store persistent data, recommeded option.

#### method 1 use .env file to define path

```yaml
# GITLAB_HOME: /path/to/gitlab - defined inside the `.env` file.
'${GITLAB_HOME}/config:/etc/gitlab'
'${GITLAB_HOME}/logs:/var/log/gitlab'
'${GITLAB_HOME}/data:/var/opt/gitlab'
```

#### method 2 set absoluut path in the docker-compose.yaml directly

```yaml
'/path/to/gitlab/config:/etc/gitlab'
'/path/to/gitlab/logs:/var/log/gitlab'
'/path/to/gitlab/data:/var/opt/gitlab'
```

### Generic settings

```yaml
# set gitlab_rails shell_ssh_port
gitlab_rails['gitlab_shell_ssh_port'] = 22
```

### NGINX settings

http to https

```yaml
nginx['redirect_http_to_https'] = true
```

### configuring HTTPS Automatic Let’s Encrypt Renewal

Explicitly set renewal times by adding the following to /etc/gitlab/gitlab.rb

```yaml
# This example renews every 7th day at 12:30
letsencrypt['auto_renew_hour'] = "12"
letsencrypt['auto_renew_minute'] = "30"
letsencrypt['auto_renew_day_of_month'] = "*/7"
```

## 3. Usefull commands

1. Run docker container with docker-compose

   **_first time the container is run, the initialization process may take a long time._**

   ```bash
   # make sure you are in the folder where the docker-compose.yaml file is stored.
   docker-compose up -d
   ```

2. Get logging from container, to check if everything works!

   ```bash
    docker logs -f gitlab
   ```

## Changelog

1. removed root_password.txt, removed set auto add root password secret from docker-compose.yaml and gitlab.rb file
2. changed volume mount host, moved path to .env file.

# gitlab-docker-compose

## getting started

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

optional:

1.

## Changelog

1. removed root_password.txt, removed set auto add root password secret from docker-compose.yaml and gitlab.rb file
2. changed volume mount host, moved path to .env file.

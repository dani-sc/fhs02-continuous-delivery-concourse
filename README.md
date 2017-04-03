# fhs02-continuous-delivery-concourse

### Docker

Build docker image: `sudo docker build -t daniel/01-rails-a .`

Start container: `sudo docker run --name d_01-rails-a daniel/01-rails-a`

Stop container: `sudo docker stop d_01-rails-a`

Remove container: `sudo docker rm d_01-rails-a`

### Concourse
Follow instructions on [https://concourse.ci/docker-repository.html](https://concourse.ci/docker-repository.html). The docker-compose.yml has already been created. However, you should **set the external IP**!
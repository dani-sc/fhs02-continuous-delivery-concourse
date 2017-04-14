# fhs02-continuous-delivery-concourse

### Docker

Build docker image: `sudo docker build -t daniel/01-rails-a .`

Start container: `sudo docker run --name d_01-rails-a daniel/01-rails-a`

Stop container: `sudo docker stop d_01-rails-a`

Remove container: `sudo docker rm d_01-rails-a`

Pull container from dockerhub: 

Run integration tests manually: `sudo docker run --name my-test-1 danisc/fhs02-t01-blog bundle exec rspec`

Run brakeman manually: `sudo docker run --name my-test-1 danisc/fhs02-t01-blog brakeman -z -o brakeman_output.json`
By adding the `-z`, Brakeman will return an error code when warnings were found.

### Concourse
Follow instructions on [https://concourse.ci/docker-repository.html](https://concourse.ci/docker-repository.html). The docker-compose.yml has already been created. However, you should **set the external IP**!

Start with `docker-compose up`. Concourse is now accessible at `localhost:8080`.

Install fly: `install path/to/fly /usr/local/bin/fly`

Save target: `fly -t d_01 login -c http://localhost:8080`

Login with username `concourse` and password `changeme`.

Load pipeline with `fly -t d_01 set-pipeline -p d_01_pipeline -c pipeline.yml --load-vars-from credentials.yml`

The pipeline is currently paused. You can start it via the web interface on `http://localhost:8080/teams/main/pipelines/d_01_pipeline`.

# General notes

* In `pipeline.yml`, one should **not** change the directory inside a task/run/args, e.g. cd /blog! In this case no inputs and outputs are readable/writeable and generally everything fails
* Do not rely on Concourse documentation. As one of the developers puts it: *"[..] have lots of issues raised (~200 at any one time) and honestly, slight inconsistencies in the docs are at the low-end of our priority list."*
* The web-interface does not work without bugs in the newest version of Concourse (1.7.3). 1.7.0 is stable however.
* Concourse and Docker *leak* files and waste big amount of space over time: ǜar/libocker/aufs/diff` is filled up with old data and cannot be cleaned up easily with a command. One way that always works is to uninstall docker, remove the files as sudo, clear the trash manually as sudo, and install docker again. One might also take a look at Spotify's docker garbage collector.
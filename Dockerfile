FROM jenkinsci/blueocean

USER root

RUN mkdir build_tmp

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar -xz -C build_tmp
RUN mv build_tmp/docker/docker /usr/local/bin
RUN chmod a+x /usr/local/bin/docker

RUN curl -L https://github.com/rancher/cli/releases/download/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz | tar xz -C build_tmp
RUN mv build_tmp/rancher*/rancher /usr/local/bin 
RUN chmod a+x /usr/local/bin/rancher

RUN rm -rf build_tmp

USER jenkins

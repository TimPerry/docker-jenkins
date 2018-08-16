FROM jenkinsci/blueocean

USER root

RUN mkdir build_tmp

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar -xz -C build_tmp
RUN mv build_tmp/docker/docker /usr/local/bin
RUN chmod a+x /usr/local/bin/docker

RUN curl -L https://releases.rancher.com/cli/v2.0.3/rancher-linux-amd64-v2.0.3.tar.gz | tar xz -C build_tmp
RUN mv build_tmp/rancher*/rancher /usr/local/bin 
RUN chmod a+x /usr/local/bin/rancher

RUN curl -o build_tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl
RUN mv build_tmp/kubectl /usr/local/bin
RUN chmod a+x /usr/local/bin/kubectl

RUN curl -o build_tmp/docker-compose -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-Linux-x86_64
RUN mv build_tmp/docker-compose /usr/local/bin
RUN chmod a+x /usr/local/bin/docker-compose

RUN rm -rf build_tmp

USER jenkins

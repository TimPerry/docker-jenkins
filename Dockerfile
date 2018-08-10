FROM jenkinsci/blueocean

USER root

ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
EXPOSE 8083

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

RUN rm -rf build_tmp

USER jenkins

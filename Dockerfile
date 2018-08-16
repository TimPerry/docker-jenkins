FROM jenkinsci/blueocean

USER root

RUN mkdir build_tmp

RUN curl -L https://releases.rancher.com/cli/v2.0.3/rancher-linux-amd64-v2.0.3.tar.gz | tar xz -C build_tmp
RUN mv build_tmp/rancher*/rancher /usr/local/bin 
RUN chmod a+x /usr/local/bin/rancher

RUN curl -o build_tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl
RUN mv build_tmp/kubectl /usr/local/bin
RUN chmod a+x /usr/local/bin/kubectl

RUN apk add py-pip
RUN pip install --upgrade pip
RUN pip install docker docker-compose

RUN rm -rf build_tmp

USER jenkins

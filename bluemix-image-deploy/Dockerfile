FROM docker:latest

# add glibc
RUN apk --no-cache add ca-certificates bash
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk && \
  apk add glibc-2.23-r3.apk && \
  rm -f glibc-2.23-r3.apk

# install bx cli
WORKDIR /tmp
RUN curl -o /tmp/Bluemix_CLI.tar.gz http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_0.5.2_amd64.tar.gz && \
  tar zxvf Bluemix_CLI.tar.gz && \
  Bluemix_CLI/install_bluemix_cli && \
  rm -rf /tmp/Bluemix_CLI 
WORKDIR /

RUN bx update

# install container registry plugin
RUN bx plugin install container-registry -r Bluemix

RUN mkdir /scripts
ADD /scripts/ /scripts
RUN chmod a+x /scripts/*



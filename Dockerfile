FROM debian:stable

RUN apt update
RUN apt install -y ca-certificates

ADD http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_0.5.2_amd64.tar.gz /tmp

WORKDIR /tmp
RUN tar zxvf Bluemix_CLI_0.5.2_amd64.tar.gz
RUN Bluemix_CLI/install_bluemix_cli

RUN bx --version
RUN bx update

RUN bx plugin install container-registry -r Bluemix

ADD login.sh

ENTRYPOINT login.sh

# hangs forever
CMD [ "/bin/cat" ]

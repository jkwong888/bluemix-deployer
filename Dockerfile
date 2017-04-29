FROM debian:stable

RUN apt update
RUN apt install -y ca-certificates

ADD http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_0.5.2_amd64.tar.gz /tmp

WORKDIR /tmp
RUN tar zxvf Bluemix_CLI_0.5.2_amd64.tar.gz
RUN Bluemix_CLI/install_bluemix_cli

RUN bx --version
RUN bx update

ADD bx_login.sh /
ADD login.sh /
RUN chmod a+x /bx_login.sh
RUN chmod a+x /login.sh

ENTRYPOINT /login.sh

# hangs forever
CMD [ "/bin/cat" ]

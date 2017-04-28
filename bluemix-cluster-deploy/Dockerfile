FROM jkwong/bluemix-deployer

RUN apt install -y curl

ADD login.sh /
RUN chmod a+x /login.sh

RUN bx plugin install container-service -r Bluemix

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

RUN mv /tmp/kubectl /usr/local/bin/kubectl
RUN chmod a+x /usr/local/bin/kubectl

ENTRYPOINT  [ "/login.sh" ]
CMD ["/bin/cat" ]

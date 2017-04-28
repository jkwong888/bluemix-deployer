FROM jkwong/bluemix-deployer

# Install Docker
RUN apt-get install -y iptables
ADD https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.1~ce-0~ubuntu-xenial_amd64.deb \
	/tmp/docker.deb
RUN dpkg -i /tmp/docker.deb

ADD login.sh /
RUN chmod a+x /login.sh

RUN bx plugin install container-registry -r Bluemix


ENTRYPOINT  [ "/login.sh" ]
CMD ["/bin/cat" ]

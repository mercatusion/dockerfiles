# LOAD LISP ENV IMAGE
FROM lisp-env

# GITHUB AUTH
# build command: --build-arg GITHUB_USER=<username> --build-arg GITHUB_PASS=<password> -t <tag>
ARG GITHUB_USER=$GITHUB_USER
ARG GITHUB_PASS=$GITHUB_PASS
RUN echo "machine github.com\n\tlogin $GITHUB_USER\n\tpassword $GITHUB_PASS" >> ~/.netrc

# CLONE REPOS
RUN git clone --depth 1 https://github.com/vindarel/replic.git /root/.roswell/local-projects/replic
RUN git clone --depth 1 https://github.com/fukamachi/lack.git /root/.roswell/local-projects/lack
RUN git clone --depth 1 https://github.com/jnc-nj/asn1.git /root/.roswell/local-projects/asn1
RUN git clone --depth 1 https://github.com/jnc-nj/pem.git /root/.roswell/local-projects/pem
RUN git clone --depth 1 https://github.com/jnc-nj/py4cl.git /root/.roswell/local-projects/py4cl
RUN git clone --depth 1 https://github.com/jnc-nj/clack.git /root/.roswell/local-projects/clack
RUN git clone --depth 1 https://github.com/jnc-nj/jack-tools.git /root/.roswell/local-projects/jack-tools
RUN git clone --depth 1 https://github.com/jnc-nj/mercatus.git /root/.roswell/local-projects/mercatus

# COMPILE
WORKDIR /root/.roswell/local-projects/mercatus/roswell
RUN ros build service.ros && \
	ros build client.ros && \
	ros build repl.ros && \
	ros build quickstart.ros

# SETUP INITIAL NODES
RUN ./quickstart -g test -i test,data,contract,output,mirror -d "/root/layers/" -a 127.0.0.1 -p 9000 -ch 127.0.0.1 -cp 5984 -cu "" -ck "" -dt ""

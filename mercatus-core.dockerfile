# LOAD LISP ENV IMAGE
FROM lisp-env

# CLONE REPOS
RUN git clone https://github.com/jnc-nj/jack-tools.git /root/.roswell/local-projects/jack-tools
RUN git clone https://github.com/jnc-nj/asn1.git /root/.roswell/local-projects/asn1
RUN git clone https://github.com/jnc-nj/pem.git /root/.roswell/local-projects/pem
RUN git clone https://github.com/jnc-nj/py4cl.git /root/.roswell/local-projects/py4cl
RUN git clone https://github.com/jnc-nj/replic.git /root/.roswell/local-projects/replic
# RUN git clone https://github.com/mercatusion/mercatus-core.git /root/.roswell/local-projects/mercatus-core
ADD ./mercatus /root/.roswell/local-projects/mercatus-core

# COMPILE
WORKDIR /root/.roswell/local-projects/mercatus-core/roswell
RUN ros build service.ros && \
	ros build client.ros && \
	ros build repl.ros && \
	ros build quickstart.ros

# SETUP INITIAL NODES
RUN ./quickstart -g test -i test,data,contract,output,mirror -d "/root/layers/" -a 127.0.0.1 -p 9000 -ch 127.0.0.1 -cp 5984 -cu "" -ck "" -dt ""
RUN ls /root/layers/test/
RUN cp -rf /root/layers/test/scripts/*.service /etc/systemd/system

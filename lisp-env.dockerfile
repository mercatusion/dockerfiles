# LOAD UBUNTU IMAGE
FROM ubuntu:16.04

# UPDATE REPOSITORIES
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:couchdb/stable
RUN apt-get clean
RUN apt-get update

# INSTALL ROSWELL DEPENDENCIES
RUN apt-get -y install git \
	build-essential \
	automake \
	libcurl4-openssl-dev \
	zlib1g-dev \
	locales \
	usbutils \
	libblas-dev \
	liblapack-dev \
	systemd \
	couchdb

# SET COUCHDB OWNERSHIP
RUN chown -R couchdb:couchdb /usr/bin/couchdb /etc/couchdb /usr/share/couchdb
RUN chmod -R 0770 /usr/bin/couchdb /etc/couchdb /usr/share/couchdb
RUN systemctl restart couchdb

# CHECK COUCHDB IS RUNNING
RUN curl localhost:5984

# SET LOCALE
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

# CLONE ROSWELL
RUN git clone -b release https://github.com/roswell/roswell.git

# INSTALL ROSWELL
WORKDIR /roswell
RUN sh ./bootstrap
RUN ./configure
RUN make
RUN make install
RUN ros setup
RUN ros install sbcl/1.5.1
RUN ros use sbcl/1.5.1

# CHECK ROSWELL IS RUNNING
RUN ros version
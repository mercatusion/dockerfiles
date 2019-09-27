# LOAD MERCATUS IMAGE
FROM mercatus-core

# SETUP SERVICE
# note on port mapping: docker run -p 80:80/tcp
RUN mkdir /var/run/couchdb
RUN chown -R couchdb:couchdb /var/run/couchdb/
RUN nohup couchdb start &
EXPOSE 9001
ENTRYPOINT ["/root/.roswell/local-projects/mercatus/roswell/service", "-k", "/root/layers/test/test/test-keys.json"]
CMD ["-i", "test", "-p", "9001", "-ch", "127.0.0.1", "-cp", "5984", "-cu", "", "-ck", "", "-dt", ""]

# LOAD MERCATUS IMAGE
FROM mercatus-core

# SETUP SERVICE
# note on port mapping: docker run -p 80:80/tcp
RUN couchdb %
EXPOSE 9001
ENTRYPOINT ["/root/.roswell/local-projects/mercatus/roswell/service", "-k", "/home/jacknchou/layers/test/test/test-keys.json"]
CMD ["-i", "test", "-p", "9001", "-ch", "127.0.0.1", "-cp", "5984", "-cu", "", "-ck", "", "-dt", ""]

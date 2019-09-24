# LOAD MERCATUS IMAGE
FROM mercatus-core

# SETUP SERVICE
# note on port mapping: docker run -p 80:80/tcp
EXPOSE 9001
ENTRYPOINT ["/root/.roswell/local-projects/mercatus/roswell/client"]
CMD ["9000"]

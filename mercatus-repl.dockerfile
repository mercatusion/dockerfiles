# LOAD MERCATUS IMAGE
FROM mercatus-core

# SETUP SERVICE
ENTRYPOINT ["/root/.roswell/local-projects/mercatus/roswell/repl"]
CMD ["-h"]

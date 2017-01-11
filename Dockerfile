######################################
## RDF GraphDB Sparql Service Image ##
######################################

# Inherit official Java image, see https://hub.docker.com/_/java/
FROM java:8
# Could copy fuseki files...
# ADD ./jena-fuseki-1.1.1 /jena-fuseki
# ...or get them online (and the newer 1.4.0 should work)
RUN wget http://mirror.nexcess.net/apache/jena/binaries/apache-jena-fuseki-2.4.1.tar.gz
RUN mkdir jena-fuseki; tar -xvzf apache-jena-fuseki-2.4.1.tar.gz -C jena-fuseki --strip-components=1

# Same as "export TERM=dumb"; prevents error "Could not open terminal for stdout: $TERM not set"
ENV TERM dumb


# Define working directory
WORKDIR /

COPY run-db.sh /run-db.sh
RUN chmod +x /run-db.sh

# Expose ports (3030 for Freebase, 3037 for DBpedia)
EXPOSE 3030


CMD ["./run-db.sh"]
##########
# BEWARE #####################################################################################
# With SELinux you need to run chcon -Rt svirt_sandbox_file_t /run/media/<user>/<longid>/home/<user>/Downloads/Backends/DBpedia/jena-fuseki-1.1.1/db/
##############################################################################################

# Can be built with: "docker build -t fuseki ."

# .:: DBpedia
# docker run -it -v /home/fp/docker/data/db/:/jena-fuseki-1.1.1/db/ --entrypoint="./fuseki-server" -p 3037:3037 fuseki --port 3037 --loc db /dbpedia
# RUN ./fuseki-server --port 3037 --loc db /dbpedia is done in run command; need to map  as volume (read-only via :ro)

# .:: Freebase
# docker run -it -v /home/fp/docker/data/d-freebase/:/jena-fuseki-1.1.1/d-freebase/ --entrypoint="./fuseki-server" -p 3030:3030 fuseki --loc d-freebase /freebase
# RUN ./fuseki-server --loc d-freebase /freebase

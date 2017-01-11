#RDF Database

This repo helps sets up a jena-fuseki instance serving rdf triples.
 
Use create-index.sh on a .ttl file to create an indexed version from tdbloader that gets tar.gz'd.
Upload the tar.gz to s3, and change the url inside the run-db.sh to point to it.
 
Docker image downloads the index (if not already present) and runs jena-fuseki.

Currently used as the knowledge graph store for Yoda.
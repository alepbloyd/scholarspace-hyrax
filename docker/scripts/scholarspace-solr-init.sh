#!/bin/bash

# something with the file paths in here not working with the github runner?
# root vs. 

set -e

for solr_core in "$SOLR_CORE"_test "$SOLR_CORE"_dev $SOLR_CORE; do

    if [ ! -d "/opt/solr/server/solr/mycores/${solr_core}" ]
    then
        # Replicated from the solr-create script
        echo "----1----"
        echo "Creating ${solr_core} core"
        . /opt/docker-solr/scripts/run-initdb
        echo "----ran initdb----"
        
        echo "----2----"
        setuser solr /opt/docker-solr/scripts/precreate-core $solr_core

        # ScholarSpace-specific setup
        echo "Disabling managed schema"
        setuser solr mv /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema.bak
        echo "Migrating configs"
        setuser solr cp -r /opt/scholarspace/solr/conf /opt/solr/server/solr/mycores/${solr_core}
        echo "Starting Solr with new core..."
    else
        echo "Core ${solr_core} already exists!"
    fi
done

echo "Starting Solr ..."
setuser solr exec /opt/docker-solr/scripts/solr-foreground

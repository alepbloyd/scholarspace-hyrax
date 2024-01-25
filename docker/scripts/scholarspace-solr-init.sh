#!/bin/bash

# something with the file paths in here not working with the github runner?
# 

set -e

for solr_core in "$SOLR_CORE"_test "$SOLR_CORE"_dev $SOLR_CORE; do

    if [ ! -d "/opt/solr/server/solr/mycores/${solr_core}" ]
    then
        # Replicated from the solr-create script
        echo "Checkpoint -1"
        echo "Creating ${solr_core} core"
        echo "Checkpoint -0.5"
        . /opt/docker-solr/scripts/run-initdb
        echo "Checkpoint 0"
        /opt/docker-solr/scripts/precreate-core $solr_core # this one???
        echo "Checkpoint 1"
        # ScholarSpace-specific setup
        echo "Disabling managed schema"
        mv /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema.bak
        echo "Checkpoint 2"
        echo "Migrating configs"
        cp -r /opt/scholarspace/solr/conf /opt/solr/server/solr/mycores/${solr_core} # this one???
        echo "Starting Solr with new core..."
    else
        echo "Core ${solr_core} already exists!"
    fi
done

echo "Starting Solr ..."
exec /opt/docker-solr/scripts/solr-foreground

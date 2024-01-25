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
        
        echo "----2----"
        exec ls -alrth /opt/solr

        echo "----3----"
        mkdir -p /opt/solr/server/solr/mycores/${solr_core}

        exec ls -alrth /opt/solr/server/solr/mycores

        echo "----4----"
        /opt/docker-solr/scripts/precreate-core $solr_core
        # ScholarSpace-specific setup
        echo "Disabling managed schema"
        mv /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema.bak
        echo "Migrating configs"
        cp -r /opt/scholarspace/solr/conf /opt/solr/server/solr/mycores/${solr_core}
        echo "Starting Solr with new core..."
    else
        echo "Core ${solr_core} already exists!"
    fi
done

echo "Starting Solr ..."
exec /opt/docker-solr/scripts/solr-foreground

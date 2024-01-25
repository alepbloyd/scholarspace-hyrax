#!/bin/bash

# something with the file paths in here not working with the github runner?
# root vs. 

set -e

for solr_core in "$SOLR_CORE"_test "$SOLR_CORE"_dev $SOLR_CORE; do

    if [ ! -d "/opt/solr/server/solr/mycores/${solr_core}" ]
    then
        # Replicated from the solr-create script
        echo "----whoami------"
        echo whoami
        echo "-------- 1 --------"
        echo "Creating ${solr_core} core"
        echo "-------- 2 --------"
        . /opt/docker-solr/scripts/run-initdb
        echo "-------- 3 --------"
        . /opt/docker-solr/scripts/precreate-core $solr_core
        echo "-------- 4 --------"
        # ScholarSpace-specific setup
        echo "Disabling managed schema"
        echo "-------- 5 --------"
        mv /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema /opt/solr/server/solr/mycores/${solr_core}/conf/managed-schema.bak
        echo "-------- 6 --------"
        echo "Migrating configs"
        echo "-------- 7 --------"
        cp -r /opt/scholarspace/solr/conf /opt/solr/server/solr/mycores/${solr_core}
        echo "-------- 8 --------"
        echo "Starting Solr with new core..."
        echo "-------- 9 --------"
    else
        echo "Core ${solr_core} already exists!"
    fi
done

echo "Starting Solr ..."
exec /opt/docker-solr/scripts/solr-foreground

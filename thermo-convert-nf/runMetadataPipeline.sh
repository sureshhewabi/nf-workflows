#!/usr/bin/env bash

##### VARIABLES
ACCESSION=$1
USERNAME=$2
PASSWORD=$3
METADATA_DIR=$4
PROFILE=$5
MODE=$6
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# run Nextflow pipeline
${NEXTFLOW}nextflow run ${SCRIPT_DIR}/thermo-convert-nf.nf \
                                  -c ${SCRIPT_DIR}/nextflow.config \
                                  -profile $PROFILE \
                                  -with-report \
                                  -with-trace \
                                  --px_accession $ACCESSION \
                                  --pride_username $USERNAME \
                                  --pride_password $PASSWORD \
                                  --metadata_path "${METADATA_DIR}${ACCESSION}/data" \
                                  --mode $MODE
# Clean working directories
echo "Cleanning the working directory..."
${NEXTFLOW}nextflow clean -f $ACCESSION
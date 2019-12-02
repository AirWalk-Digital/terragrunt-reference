#!/bin/bash
export WRKDIR=$(pwd)
export LYR_PDS_DIR="layer"
        
#Init Packages Directory
mkdir -p packages/
        
# Building Python-pandas layer
cd ${WRKDIR}/${LYR_PDS_DIR}/
${WRKDIR}/${LYR_PDS_DIR}/build_layer.sh
zip -r ${WRKDIR}/packages/layer.zip ./python
rm -rf ${WRKDIR}/${LYR_PDS_DIR}/python/
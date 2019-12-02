#!/bin/bash
export PKG_DIR="python"
rm -rf ${PKG_DIR} && mkdir -p ${PKG_DIR}
# create baseline and requirements files
docker run -v $(pwd):/foo -w /foo lambci/lambda:build-python3.7 \
pip freeze > baseline.txt \
&& pip install -r requirements.txt \
&& pip freeze > all.txt \
&& awk 'FNR==NR {a[$0]++; next} !a[$0]' baseline.txt all.txt > layer.txt

# build the layer
docker run -v $(pwd):/foo -w /foo lambci/lambda:build-python3.7 \
pip install --ignore-installed -r layer.txt -t ${PKG_DIR}

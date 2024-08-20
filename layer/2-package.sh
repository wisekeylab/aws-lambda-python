#!/bin/bash
# make common python3.11 layer for all lambda functions
mkdir -p python311_layer_content/python
cd python311_layer_content
cp -r ../create_layer_virtualenv/lib python/
zip -r ../python311_layer_content.zip python
cd .. # should be at layer directory

py_exclude=('*.pyc' '*__pycache__*')

# make mpic_coordinator lambda layer for mpic coordinator lambda function
mkdir -p mpic_coordinator_layer_content/python/aws_lambda_python
cp -r ../src/aws_lambda_python/mpic_coordinator mpic_coordinator_layer_content/python/aws_lambda_python/mpic_coordinator
cd mpic_coordinator_layer_content
zip -r ../mpic_coordinator_layer_content.zip python -x "${py_exclude[@]}" # Zip the mpic_coordinator lambda layer
rm -r python # clean up, mostly not to bother the IDE which will find this duplicate code!
cd .. # should be at layer directory

# make mpic_common lambda layer for all lambda functions
mkdir -p mpic_common_layer_content/python/aws_lambda_python
cp -r ../src/aws_lambda_python/mpic_common mpic_common_layer_content/python/aws_lambda_python/mpic_common
cd mpic_common_layer_content
zip -r ../mpic_common_layer_content.zip python -x "${py_exclude[@]}" # Zip the mpic_common lambda layer
rm -r python # clean up, mostly not to bother the IDE which will find this duplicate code!

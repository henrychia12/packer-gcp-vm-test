#!/bin/bash
ARTIFACT=`packer build -machine-readable packer.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
image_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "image_ID" { default = "'${image_ID}'" }' > imagevar.tf
terraform init
terraform apply

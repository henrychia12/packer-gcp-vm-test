#!/bin/bash
ARTIFACT=`packer build -machine-readable frontend-packer.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
frontend_image_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "frontend_image_ID" { default = "'${frontend_image_ID}'" }' > frontend_imagevar.tf
ARTIFACT=`packer build -machine-readable jenkins-packer.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
jenkins_image_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "jenkins_image_ID" { default = "'${jenkins_image_ID}'" }' > jenkins_imagevar.tf
terraform init
terraform apply

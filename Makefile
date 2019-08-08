.PHONY = terraform_apply

define PACKER_VARS
	-var project_id=$(shell gcloud config list --format 'value(core.project)') \
	-var account_file=${ACCOUNT_FILE}
endef

TEMPLATE="jenkins.json"

packer_build:
	packer build ${PACKER_VARS} ${TEMPLATE}


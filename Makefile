
SHELL := bash

.PHONY: update-db-with-backup
update-db-with-backup:
	echo "Starting at `date`"
	echo -e "\nCreating backup db"
	if [ -e mv update-opusapi/opusdata.db ]; then \
	  mv update-opusapi/opusdata.db update-opusapi/backups/$(shell date +"%Y%m%d%H%M%S")_opusdata.db; \
	fi
	echo -e "\nCreating opusdata.db ..."
	cd update-opusapi && opus_get -u -db opusdata.db -q
	echo -e "\nopusdata.db created"
	cp update-opusapi/opusdata.db .
	echo "Finished at `date`"

.PHONY: update-db update-db-without-backup
update-db update-db-without-backup:
	echo "Starting at `date`"
	echo -e "\nCreating opusdata.db ..."
	cd update-opusapi && opus_get -u -db opusdata.db -q
	echo -e "\nopusdata.db created"
	cp update-opusapi/opusdata.db .
	echo "Finished at `date`"

DB=enceladus
BUILD=${CURDIR}/build.sql
SCRIPTS=${CURDIR}/scripts
MASTER=$(SCRIPTS)/import.sql
NORMALIZE=$(SCRIPTS)/normalize.sql
# Note that scripts/normalize.sql also has a CSV location - not sure why this is defined here (it's not used), and not passed through
#CSV='/Users/andrewenfield/cassini/master_plan.csv'
#CSV='/mnt/c/Users/andrewe/Downloads/cassini_data/data/master_plan.csv'


all: normalize
	psql $(DB) -f $(BUILD)

#master:

import: #master
	@cat $(MASTER) >> $(BUILD)
#	@echo "COPY import.master_plan FROM $(CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean:
	@rm -rf $(BUILD)
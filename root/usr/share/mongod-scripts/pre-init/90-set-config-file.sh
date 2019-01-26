# This script uses the mongod.conf.template provided and replaces all the
# environment variables generated by previous scripts
# warning this will change the mongo_common_args to add the -f flag with 
# the config file path
cp ${CONTAINER_SCRIPTS_PATH}/mongod.conf.template $MONGODB_CONFIG_PATH

# Substitute environment variables in configuration file
TEMP=`mktemp`; cp ${MONGODB_CONFIG_PATH} $TEMP; envsubst > ${MONGODB_CONFIG_PATH} < $TEMP

mongo_common_args+="-f ${MONGODB_CONFIG_PATH}"

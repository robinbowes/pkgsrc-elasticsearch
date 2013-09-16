#!/bin/sh
exec 2>&1
local_config=@ES_CONF_DIR@/local.conf
[ -f "$local_config" ] && . "$local_config"
exec @ES_BIN_DIR@/elasticsearch -f

pkgsrc config to build elasticsearch

Developed on a Joyent Instance (multiarch 13.2.2) running on SmartOS joyent_20130905T204057Z

Todo:
 * add SMF manifest
 * work out how to set JAVA_HOME and other configuration vars, eg.
   - ES_JAVA_OPTS
   - ES_HEAP_SIZE
   - ES_MIN_MEM
   - ES_MAX_MEM
   - specific -X and/or -D options

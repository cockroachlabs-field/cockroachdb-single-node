SET CLUSTER SETTING kv.raft_log.disable_synchronization_unsafe = true;
SET CLUSTER SETTING kv.range_merge.queue_interval = '50ms';
SET CLUSTER SETTING kv.closed_timestamp.lead_for_global_reads_override = '1ms'
SET CLUSTER SETTING jobs.registry.interval.gc = '30s';
SET CLUSTER SETTING jobs.registry.interval.cancel = '180s';
SET CLUSTER SETTING jobs.retention_time = '15s';
SET CLUSTER SETTING schemachanger.backfiller.buffer_increment = '128 KiB';
--SET CLUSTER SETTING sql.catalog.unsafe_skip_system_config_trigger = true;
SET CLUSTER SETTING sql.stats.automatic_collection.enabled = false;

ALTER RANGE default CONFIGURE ZONE USING gc.ttlseconds = 5;
ALTER DATABASE system CONFIGURE ZONE USING gc.ttlseconds = 5;

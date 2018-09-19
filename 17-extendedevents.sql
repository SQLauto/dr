﻿/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:58
	See https://dbatools.io/Export-DbaScript for more information
*/
CREATE EVENT SESSION [AlwaysOn_health] ON SERVER 
ADD EVENT sqlserver.alwayson_ddl_executed,
ADD EVENT sqlserver.availability_group_lease_expired,
ADD EVENT sqlserver.availability_replica_automatic_failover_validation,
ADD EVENT sqlserver.availability_replica_manager_state_change,
ADD EVENT sqlserver.availability_replica_state,
ADD EVENT sqlserver.availability_replica_state_change,
ADD EVENT sqlserver.error_reported(
    WHERE ([error_number]=(9691) OR [error_number]=(35204) OR [error_number]=(9693) OR [error_number]=(26024) OR [error_number]=(28047) OR [error_number]=(26023) OR [error_number]=(9692) OR [error_number]=(28034) OR [error_number]=(28036) OR [error_number]=(28048) OR [error_number]=(28080) OR [error_number]=(28091) OR [error_number]=(26022) OR [error_number]=(9642) OR [error_number]=(35201) OR [error_number]=(35202) OR [error_number]=(35206) OR [error_number]=(35207) OR [error_number]=(26069) OR [error_number]=(26070) OR [error_number]>(41047) AND [error_number]<(41056) OR [error_number]=(41142) OR [error_number]=(41144) OR [error_number]=(1480) OR [error_number]=(823) OR [error_number]=(824) OR [error_number]=(829) OR [error_number]=(35264) OR [error_number]=(35265) OR [error_number]=(41188) OR [error_number]=(41189))),
ADD EVENT sqlserver.hadr_db_partner_set_sync_state,
ADD EVENT sqlserver.lock_redo_blocked
ADD TARGET package0.event_file(SET filename=N'AlwaysOn_health.xel',max_file_size=(5),max_rollover_files=(4))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [Queries and Resources] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sp_statement_completed(SET collect_object_name=(1)
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_statement_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0))))
ADD TARGET package0.event_file(SET filename=N'capture_queries_and_resources',max_rollover_files=(0)),
ADD TARGET package0.ring_buffer(SET max_memory=(1048576))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=ON,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [Query Timeouts] ON SERVER 
ADD EVENT sqlserver.sql_statement_completed(
    ACTION(sqlserver.query_hash,sqlserver.session_id,sqlserver.tsql_stack)),
ADD EVENT sqlserver.sql_statement_starting(
    ACTION(sqlserver.query_hash,sqlserver.session_id,sqlserver.tsql_stack))
ADD TARGET package0.pair_matching(SET begin_event=N'sqlserver.sql_statement_starting',begin_matching_actions=N'sqlserver.session_id, sqlserver.tsql_stack',end_event=N'sqlserver.sql_statement_completed',end_matching_actions=N'sqlserver.session_id, sqlserver.tsql_stack',respond_to_memory_pressure=(0))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=5 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=ON,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [Query Wait Statistics Detail] ON SERVER 
ADD EVENT sqlos.wait_info(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlos.wait_info_external(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.rpc_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.rpc_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sp_statement_completed(SET collect_object_name=(1),collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sp_statement_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_batch_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_statement_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlserver.sql_statement_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE ([package0].[divides_by_uint64]([sqlserver].[session_id],(5)) AND [package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0))))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=ON,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [Query Wait Statistics] ON SERVER 
ADD EVENT sqlos.wait_completed(SET collect_wait_resource=(1)
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlos.wait_info(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlos.wait_info_external(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0))))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [Stored Procedure Parameters] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_output_parameters=(1),collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4))))
ADD TARGET package0.ring_buffer
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

CREATE EVENT SESSION [system_health] ON SERVER 
ADD EVENT sqlclr.clr_allocation_failure(
    ACTION(package0.callstack,sqlserver.session_id)),
ADD EVENT sqlclr.clr_virtual_alloc_failure(
    ACTION(package0.callstack,sqlserver.session_id)),
ADD EVENT sqlos.memory_broker_ring_buffer_recorded,
ADD EVENT sqlos.memory_node_oom_ring_buffer_recorded(
    ACTION(package0.callstack,sqlserver.session_id,sqlserver.sql_text,sqlserver.tsql_stack)),
ADD EVENT sqlos.process_killed(
    ACTION(package0.callstack,sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.query_hash,sqlserver.session_id,sqlserver.session_nt_username)),
ADD EVENT sqlos.scheduler_monitor_deadlock_ring_buffer_recorded,
ADD EVENT sqlos.scheduler_monitor_non_yielding_iocp_ring_buffer_recorded,
ADD EVENT sqlos.scheduler_monitor_non_yielding_ring_buffer_recorded,
ADD EVENT sqlos.scheduler_monitor_non_yielding_rm_ring_buffer_recorded,
ADD EVENT sqlos.scheduler_monitor_stalled_dispatcher_ring_buffer_recorded,
ADD EVENT sqlos.scheduler_monitor_system_health_ring_buffer_recorded,
ADD EVENT sqlos.wait_info(
    ACTION(package0.callstack,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([duration]>(15000) AND ([wait_type]>=N'LATCH_NL' AND ([wait_type]>=N'PAGELATCH_NL' AND [wait_type]<=N'PAGELATCH_DT' OR [wait_type]<=N'LATCH_DT' OR [wait_type]>=N'PAGEIOLATCH_NL' AND [wait_type]<=N'PAGEIOLATCH_DT' OR [wait_type]>=N'IO_COMPLETION' AND [wait_type]<=N'NETWORK_IO' OR [wait_type]=N'RESOURCE_SEMAPHORE' OR [wait_type]=N'SOS_WORKER' OR [wait_type]>=N'FCB_REPLICA_WRITE' AND [wait_type]<=N'WRITELOG' OR [wait_type]=N'CMEMTHREAD' OR [wait_type]=N'TRACEWRITE' OR [wait_type]=N'RESOURCE_SEMAPHORE_MUTEX') OR [duration]>(30000) AND [wait_type]<=N'LCK_M_RX_X'))),
ADD EVENT sqlos.wait_info_external(
    ACTION(package0.callstack,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([duration]>(5000) AND ([wait_type]>=N'PREEMPTIVE_OS_GENERICOPS' AND [wait_type]<=N'PREEMPTIVE_OS_ENCRYPTMESSAGE' OR [wait_type]>=N'PREEMPTIVE_OS_INITIALIZESECURITYCONTEXT' AND [wait_type]<=N'PREEMPTIVE_OS_QUERYSECURITYCONTEXTTOKEN' OR [wait_type]>=N'PREEMPTIVE_OS_AUTHZGETINFORMATIONFROMCONTEXT' AND [wait_type]<=N'PREEMPTIVE_OS_REVERTTOSELF' OR [wait_type]>=N'PREEMPTIVE_OS_CRYPTACQUIRECONTEXT' AND [wait_type]<=N'PREEMPTIVE_OS_DEVICEOPS' OR [wait_type]>=N'PREEMPTIVE_OS_NETGROUPGETUSERS' AND [wait_type]<=N'PREEMPTIVE_OS_NETUSERMODALSGET' OR [wait_type]>=N'PREEMPTIVE_OS_NETVALIDATEPASSWORDPOLICYFREE' AND [wait_type]<=N'PREEMPTIVE_OS_DOMAINSERVICESOPS' OR [wait_type]=N'PREEMPTIVE_OS_VERIFYSIGNATURE' OR [duration]>(45000) AND ([wait_type]>=N'PREEMPTIVE_OS_SETNAMEDSECURITYINFO' AND [wait_type]<=N'PREEMPTIVE_CLUSAPI_CLUSTERRESOURCECONTROL' OR [wait_type]>=N'PREEMPTIVE_OS_RSFXDEVICEOPS' AND [wait_type]<=N'PREEMPTIVE_OS_DSGETDCNAME' OR [wait_type]>=N'PREEMPTIVE_OS_DTCOPS' AND [wait_type]<=N'PREEMPTIVE_DTC_ABORT' OR [wait_type]>=N'PREEMPTIVE_OS_CLOSEHANDLE' AND [wait_type]<=N'PREEMPTIVE_OS_FINDFILE' OR [wait_type]>=N'PREEMPTIVE_OS_GETCOMPRESSEDFILESIZE' AND [wait_type]<=N'PREEMPTIVE_ODBCOPS' OR [wait_type]>=N'PREEMPTIVE_OS_DISCONNECTNAMEDPIPE' AND [wait_type]<=N'PREEMPTIVE_CLOSEBACKUPMEDIA' OR [wait_type]=N'PREEMPTIVE_OS_AUTHENTICATIONOPS' OR [wait_type]=N'PREEMPTIVE_OS_FREECREDENTIALSHANDLE' OR [wait_type]=N'PREEMPTIVE_OS_AUTHORIZATIONOPS' OR [wait_type]=N'PREEMPTIVE_COM_COCREATEINSTANCE' OR [wait_type]=N'PREEMPTIVE_OS_NETVALIDATEPASSWORDPOLICY' OR [wait_type]=N'PREEMPTIVE_VSS_CREATESNAPSHOT')))),
ADD EVENT sqlserver.connectivity_ring_buffer_recorded(SET collect_call_stack=(1)),
ADD EVENT sqlserver.error_reported(
    ACTION(package0.callstack,sqlserver.database_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.tsql_stack)
    WHERE ([severity]>=(20) OR ([error_number]=(17803) OR [error_number]=(701) OR [error_number]=(802) OR [error_number]=(8645) OR [error_number]=(8651) OR [error_number]=(8657) OR [error_number]=(8902) OR [error_number]=(41354) OR [error_number]=(41355) OR [error_number]=(41367) OR [error_number]=(41384) OR [error_number]=(41336) OR [error_number]=(41309) OR [error_number]=(41312) OR [error_number]=(41313)))),
ADD EVENT sqlserver.security_error_ring_buffer_recorded(SET collect_call_stack=(1)),
ADD EVENT sqlserver.sp_server_diagnostics_component_result(SET collect_data=(1)
    WHERE ([sqlserver].[is_system]=(1) AND [component]<>(4))),
ADD EVENT sqlserver.sql_exit_invoked(
    ACTION(package0.callstack,sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.query_hash,sqlserver.session_id,sqlserver.session_nt_username)),
ADD EVENT sqlserver.xml_deadlock_report
ADD TARGET package0.event_file(SET filename=N'system_health.xel',max_file_size=(5),max_rollover_files=(4)),
ADD TARGET package0.ring_buffer(SET max_events_limit=(5000),max_memory=(4096))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=120 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=ON)
GO

CREATE EVENT SESSION [telemetry_xevents] ON SERVER 
ADD EVENT qds.query_store_db_diagnostics,
ADD EVENT sqlserver.always_encrypted_query_count,
ADD EVENT sqlserver.auto_stats,
ADD EVENT sqlserver.column_store_index_build_low_memory,
ADD EVENT sqlserver.column_store_index_build_throttle,
ADD EVENT sqlserver.columnstore_delete_buffer_flush_failed,
ADD EVENT sqlserver.columnstore_delta_rowgroup_closed,
ADD EVENT sqlserver.columnstore_index_reorg_failed,
ADD EVENT sqlserver.columnstore_log_exception,
ADD EVENT sqlserver.columnstore_rowgroup_merge_failed,
ADD EVENT sqlserver.columnstore_tuple_mover_delete_buffer_truncate_timed_out,
ADD EVENT sqlserver.columnstore_tuple_mover_end_compress,
ADD EVENT sqlserver.data_masking_ddl_column_definition,
ADD EVENT sqlserver.data_masking_traffic,
ADD EVENT sqlserver.data_masking_traffic_masked_only,
ADD EVENT sqlserver.database_cmptlevel_change,
ADD EVENT sqlserver.database_created,
ADD EVENT sqlserver.database_dropped,
ADD EVENT sqlserver.error_reported(
    WHERE ([severity]>=(16) OR ([error_number]=(18456) OR [error_number]=(17803) OR [error_number]=(701) OR [error_number]=(802) OR [error_number]=(8645) OR [error_number]=(8651) OR [error_number]=(8657) OR [error_number]=(8902) OR [error_number]=(41354) OR [error_number]=(41355) OR [error_number]=(41367) OR [error_number]=(41384) OR [error_number]=(41336) OR [error_number]=(41309) OR [error_number]=(41312) OR [error_number]=(41313)))),
ADD EVENT sqlserver.json_function_compiled(
    ACTION(sqlserver.database_id)),
ADD EVENT sqlserver.missing_column_statistics,
ADD EVENT sqlserver.missing_join_predicate,
ADD EVENT sqlserver.natively_compiled_module_inefficiency_detected,
ADD EVENT sqlserver.natively_compiled_proc_slow_parameter_passing,
ADD EVENT sqlserver.query_memory_grant_blocking,
ADD EVENT sqlserver.reason_many_foreign_keys_operator_not_used,
ADD EVENT sqlserver.rls_query_count,
ADD EVENT sqlserver.sequence_function_used(
    ACTION(sqlserver.database_id)),
ADD EVENT sqlserver.server_memory_change,
ADD EVENT sqlserver.server_start_stop,
ADD EVENT sqlserver.stretch_database_disable_completed,
ADD EVENT sqlserver.stretch_database_enable_completed,
ADD EVENT sqlserver.stretch_database_reauthorize_completed,
ADD EVENT sqlserver.stretch_index_reconciliation_codegen_completed,
ADD EVENT sqlserver.stretch_query_telemetry,
ADD EVENT sqlserver.stretch_remote_column_execution_completed,
ADD EVENT sqlserver.stretch_remote_column_reconciliation_codegen_completed,
ADD EVENT sqlserver.stretch_remote_error,
ADD EVENT sqlserver.stretch_remote_index_execution_completed,
ADD EVENT sqlserver.stretch_table_alter_ddl,
ADD EVENT sqlserver.stretch_table_codegen_completed,
ADD EVENT sqlserver.stretch_table_create_ddl,
ADD EVENT sqlserver.stretch_table_data_reconciliation_results_event,
ADD EVENT sqlserver.stretch_table_hinted_admin_delete_event,
ADD EVENT sqlserver.stretch_table_hinted_admin_update_event,
ADD EVENT sqlserver.stretch_table_predicate_not_specified,
ADD EVENT sqlserver.stretch_table_predicate_specified,
ADD EVENT sqlserver.stretch_table_query_error,
ADD EVENT sqlserver.stretch_table_remote_creation_completed,
ADD EVENT sqlserver.stretch_table_row_migration_results_event,
ADD EVENT sqlserver.stretch_table_row_unmigration_results_event,
ADD EVENT sqlserver.stretch_table_unprovision_completed,
ADD EVENT sqlserver.stretch_table_validation_error,
ADD EVENT sqlserver.string_escape_compiled(
    ACTION(sqlserver.database_id)),
ADD EVENT sqlserver.temporal_ddl_period_add,
ADD EVENT sqlserver.temporal_ddl_period_drop,
ADD EVENT sqlserver.temporal_ddl_schema_check_fail,
ADD EVENT sqlserver.temporal_ddl_system_versioning,
ADD EVENT sqlserver.temporal_dml_transaction_fail,
ADD EVENT sqlserver.window_function_used(
    ACTION(sqlserver.database_id)),
ADD EVENT sqlserver.xtp_alter_table,
ADD EVENT sqlserver.xtp_db_delete_only_mode_updatedhktrimlsn,
ADD EVENT sqlserver.xtp_stgif_container_added,
ADD EVENT sqlserver.xtp_stgif_container_deleted,
ADD EVENT XtpCompile.cl_duration,
ADD EVENT XtpEngine.parallel_alter_stats,
ADD EVENT XtpEngine.serial_alter_stats,
ADD EVENT XtpEngine.xtp_db_delete_only_mode_enter,
ADD EVENT XtpEngine.xtp_db_delete_only_mode_exit,
ADD EVENT XtpEngine.xtp_db_delete_only_mode_update,
ADD EVENT XtpEngine.xtp_physical_db_restarted
ADD TARGET package0.ring_buffer(SET occurrence_number=(100))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=120 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=ON)
GO


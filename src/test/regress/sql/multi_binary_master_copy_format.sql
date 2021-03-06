--
-- MULTI_BINARY_MASTER_COPY
--


SET citus.next_shard_id TO 430000;


-- Try binary master copy for different executors

SET citus.binary_master_copy_format TO 'on';
SET citus.task_executor_type TO 'task-tracker';

SELECT count(*) FROM lineitem;
SELECT l_shipmode FROM lineitem WHERE l_partkey = 67310 OR l_partkey = 155190;

SET citus.task_executor_type TO 'real-time';

SELECT count(*) FROM lineitem;
SELECT l_shipmode FROM lineitem WHERE l_partkey = 67310 OR l_partkey = 155190;

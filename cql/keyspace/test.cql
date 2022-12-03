-- 1
CREATE KEYSPACE myks
WITH replication = { 'class': 'NetworkTopologyStrategy', 'DC1': 2, 'DC2': 3 };

-- dsbulk count tells you a table in this keyspace has 500,000 rows.

-- How many rows of this table are stored in the whole cluster ?
-- Which CL guarantees a request will not be handled by more than one data center?
--

-- 2
-- What is a digest request?
-- A request coordinator node may send to some replica
-- A daily request to backup data on disk
-- A request a master node can send to meet the required
-- There is no request type in Cassndra



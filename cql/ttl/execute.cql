ssh vanja1616@51.250.29.157


cd cassandra-scylla/docker/

docker exec -ti docker_cassandra-node1_1 bash


nodetool status

cqlsh 172.18.0.2 -u cassandra -p password123



CREATE KEYSPACE IF NOT EXISTS ttl_examples WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2};


CREATE TABLE IF NOT EXISTS ttl_examples.test
(
    k  text PRIMARY KEY,
    v1 int,
    v2 int
);

SELECT k, v1, v2 FROM ttl_examples.test;



INSERT INTO ttl_examples.test (k, v1, v2)
VALUES ('test', 1, 1) USING TTL 20;

SELECT k, v1, v2 FROM ttl_examples.test;
SELECT k, writetime(v1), writetime(v2) FROM ttl_examples.test;


INSERT INTO ttl_examples.test (k, v1, v2) VALUES ('test', 1, 1) USING TTL 20;
UPDATE ttl_examples.test USING TTL 20 SET v1=888 WHERE k='test';

SELECT k, v1, v2 FROM ttl_examples.test;
SELECT k, writetime(v1), writetime(v2) FROM ttl_examples.test;


INSERT INTO ttl_examples.test (k, v1, v2) VALUES ('test', 2, 2);
UPDATE ttl_examples.test USING TTL 20 SET v1=888 WHERE k='test';


INSERT INTO ttl_examples.test (k, v1, v2) VALUES ('test', 2, 2);

SELECT k, v1, v2 FROM ttl_examples.test;
SELECT k, writetime(v1), writetime(v2) FROM ttl_examples.test;
SELECT k, TTL(v1), TTL(v2) FROM ttl_examples.test;

--


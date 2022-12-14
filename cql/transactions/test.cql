ssh vanja1616@51.250.29.157


cd cassandra-scylla/docker/

docker exec -ti docker_cassandra-node1_1 bash

nodetool status

cqlsh 172.18.0.3 -u cassandra -p password123






CREATE KEYSPACE IF NOT EXISTS transaction WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1};

USE transaction;

--     report 1 - query:    select network, description where sensor_id = ???

DROP TABLE IF EXISTS sensors;
CREATE TABLE IF NOT EXISTS sensors
(
    sensor      TEXT,
    network     TEXT,
    description TEXT,
    region      TEXT,
    PRIMARY KEY ((sensor))
);

--     report 2 - query:    select sensor, latitude, longitude, characteristics from sensors where network = ???
--     report 3 - query:    select charest group by min(), max() from sensors_by_network where network = ???

DROP TABLE IF EXISTS sensors_by_network;
CREATE TABLE IF NOT EXISTS sensors_by_network
(
    sensor          TEXT,
    network         TEXT,
    latitude        DECIMAL,
    longitude       DECIMAL,
    characteristics MAP<TEXT, TEXT>,
    PRIMARY KEY ((network), sensor)
);

DESC TABLES;

SELECT * FROM sensors;
SELECT * FROM sensors_by_network;


BEGIN BATCH
    INSERT INTO sensors (sensor, network, description, region)
    VALUES ('s1001', 'forest-net', 'forest fire detection network', 'south');

--      Invalid transaction in batch
    INSERT INTO sensors (sensor, network, description, region)
    VALUES (2, 'forest-net', 'forest fire detection network', 'south');

    INSERT INTO sensors_by_network (sensor, network, latitude, longitude, characteristics)
    VALUES ('s1001', 'forest-net', 30.526503, -95.582815, {'accuracy' : 'medium', 'sensitivity':'high'});
APPLY BATCH;

SELECT * FROM sensors;
SELECT * FROM sensors_by_network;


BEGIN BATCH
    UPDATE sensors SET network = 'volcano-net' WHERE sensor = 's1001';

    INSERT INTO sensors_by_network (sensor, network, latitude, longitude, characteristics)
    VALUES ('s1001', 'volcano-net', 30.526503, -95.582815, {'accuracy' : 'medium', 'sensitivity':'high'});

    DELETE FROM sensors_by_network WHERE network = 'forest-net' AND sensor = 's1001';
APPLY BATCH;









INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('volcano-net', 's2001', 44.460321, -110.828151, {'accuracy' : 'high', 'sensitivity':'medium'});
INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('volcano-net', 's2002', 44.463195, -110.830124, {'accuracy' : 'high', 'sensitivity':'medium'});

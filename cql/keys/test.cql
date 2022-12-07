ssh vanja1616@51.250.29.157


docker exec -ti cass_cassandra-node1_1 bash

nodetool status

cqlsh 172.30.0.2 -u cassandra -p password123


CREATE KEYSPACE sensor WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2};

USE sensor;

DESC TABLES;

CREATE TABLE IF NOT EXISTS networks
(
    name        TEXT,
    description TEXT,
    region      TEXT,
    PRIMARY KEY ((name)
) );

CREATE TABLE IF NOT EXISTS sensors_by_network
(
    network         TEXT,
    sensor          TEXT,
    latitude        DECIMAL,
    longitude       DECIMAL,
    characteristics MAP< TEXT,
    TEXT>,
    PRIMARY KEY ((network),
    sensor
)
    );

-- what is no good there?
CREATE TABLE IF NOT EXISTS temperatures_by_sensor_bad
(
    sensor    TEXT,
    timestamp TIMESTAMP,
    value     FLOAT,
    PRIMARY KEY ((sensor),
    timestamp
) ) WITH CLUSTERING ORDER BY (timestamp DESC);



DROP TABLE temperatures_by_sensor_bad;

CREATE TABLE temperatures_by_sensor
(
    sensor    TEXT,
    date      DATE,
    timestamp TIMESTAMP,
    value     FLOAT,
    PRIMARY KEY ((sensor, date),
    timestamp
) )
WITH CLUSTERING ORDER BY (timestamp DESC);

DESC TABLES;

--     CRUD operations
INSERT INTO networks (name, description, region)
VALUES ('forest-net',
        'forest fire detection network',
        'south');

INSERT INTO networks (name, description, region)
VALUES ('volcano-net',
        'volcano monitoring network',
        'north');



INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('forest-net', 's1001', 30.526503, -95.582815, {'accuracy' : 'medium', 'sensitivity':'high'});
INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('forest-net', 's1002', 30.518650, -95.583585, {'accuracy' : 'medium', 'sensitivity':'high'});
INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('forest-net', 's1003', 30.515056, -95.556225, {'accuracy' : 'medium', 'sensitivity':'high'});
INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('volcano-net', 's2001', 44.460321, -110.828151, {'accuracy' : 'high', 'sensitivity':'medium'});
INSERT INTO sensors_by_network (network, sensor, latitude, longitude, characteristics)
VALUES ('volcano-net', 's2002', 44.463195, -110.830124, {'accuracy' : 'high', 'sensitivity':'medium'});



INSERT INTO temperatures_by_sensor (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-04', '2020-07-04 00:00:01', 80);
INSERT INTO temperatures_by_sensor (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-04', '2020-07-04 00:59:59', 79);
INSERT INTO temperatures_by_sensor (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-04', '2020-07-04 12:00:01', 97);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-04', '2020-07-04 12:59:59', 98);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-04', '2020-07-04 00:00:01', 82);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-04', '2020-07-04 00:59:59', 80);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-04', '2020-07-04 12:00:01', 100);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-04', '2020-07-04 12:59:59', 100);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-04', '2020-07-04 00:00:01', 81);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-04', '2020-07-04 00:59:59', 80);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-04', '2020-07-04 12:00:01', 99);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-04', '2020-07-04 12:59:59', 98);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-05', '2020-07-05 00:00:01', 81);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-05', '2020-07-05 00:59:59', 80);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-05', '2020-07-05 12:00:01', 98);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-05', '2020-07-05 12:59:59', 99);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-05', '2020-07-05 00:00:01', 82);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-05', '2020-07-05 00:59:59', 82);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-05', '2020-07-05 12:00:01', 100);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-05', '2020-07-05 12:59:59', 99);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-05', '2020-07-05 00:00:01', 83);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-05', '2020-07-05 00:59:59', 82);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-05', '2020-07-05 12:00:01', 101);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-05', '2020-07-05 12:59:59', 102);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-06', '2020-07-06 00:00:01', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-06', '2020-07-06 00:59:59', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-06', '2020-07-06 12:00:01', 106);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1001', '2020-07-06', '2020-07-06 12:59:59', 107);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-06', '2020-07-06 00:00:01', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-06', '2020-07-06 00:59:59', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-06', '2020-07-06 12:00:01', 108);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-06', '2020-07-06 12:59:59', 110);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-06', '2020-07-06 00:00:01', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-06', '2020-07-06 00:59:59', 90);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-06', '2020-07-06 12:00:01', 1315);
INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1003', '2020-07-06', '2020-07-06 12:59:59', 1429);


-- read operation
SELECT *
FROM networks;

SELECT *
FROM sensors_by_network;

SELECT sensor, characteristics, latitude, longitude
FROM sensors_by_network
WHERE network = 'forest-net';

-- bad requests
SELECT sensor, characteristics, latitude, longitude
FROM sensors_by_network
WHERE sensor = 's1001';

-- good response
SELECT sensor, characteristics, latitude, longitude
FROM sensors_by_network
WHERE network = 'forest-net'
  AND sensor = 's1001';

SELECT *
FROM temperatures_by_sensor;

SELECT timestamp, value
FROM temperatures_by_sensor
WHERE sensor = 's1002'
  AND date = '2020-07-05';

-- update operation

INSERT INTO temperatures_by_sensor
    (sensor, date, timestamp, value)
VALUES ('s1002', '2020-07-05', '2020-07-05 00:00:01', 82);


SELECT *
FROM temperatures_by_sensor
WHERE sensor = 's1002'
  AND date = '2020-07-05'
  AND timestamp = '2020-07-05 00:00:01';

UPDATE temperatures_by_sensor
SET value = 92
WHERE sensor = 's1002'
  AND date = '2020-07-05'
  AND timestamp = '2020-07-05 00:00:01';


SELECT *
FROM temperatures_by_sensor
WHERE sensor = 's1002'
  AND date = '2020-07-05'
  AND timestamp = '2020-07-05 00:00:01';




-- delete operation


-- Partition level delete
--  Get a partition
SELECT *  FROM temperatures_by_sensor
WHERE sensor='s1002'
  AND date='2020-07-05';

--  Delete at Partition level
DELETE FROM temperatures_by_sensor
WHERE sensor='s1002'
  AND date='2020-07-05';

--  Read again
SELECT *  from temperatures_by_sensor
WHERE sensor='s1002'
  AND date='2020-07-05';


-- Row-level delete
--  Get a partition
SELECT *  from temperatures_by_sensor
WHERE sensor='s1002'
  AND date='2020-07-04';

--  Delete at Row level
DELETE FROM temperatures_by_sensor
where sensor='s1002'
  AND date='2020-07-04'
  AND timestamp='2020-07-04 00:00:01.000000+0000';

--  Read again
SELECT *  from temperatures_by_sensor
WHERE sensor='s1002'
  AND date='2020-07-04';




-- https://github.com/datastaxdevs/workshop-cassandra-fundamentals

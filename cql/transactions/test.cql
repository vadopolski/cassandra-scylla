CREATE KEYSPACE transaction WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1};

USE sensor;

DESC TABLES;

CREATE TABLE IF NOT EXISTS networks
(
    name        TEXT,
    description TEXT,
    region      TEXT,
    PRIMARY KEY ((name))
);

CREATE TABLE IF NOT EXISTS sensors_by_network
(
    network         TEXT,
    sensor          TEXT,
    latitude        DECIMAL,
    longitude       DECIMAL,
    characteristics MAP<TEXT, TEXT>,
    PRIMARY KEY ((network), sensor)
);


INSERT INTO networks (name, description, region)
VALUES ('forest-net', 'forest fire detection network', 'south');

INSERT INTO networks (name, description, region)
VALUES ('volcano-net', 'volcano monitoring network', 'north');



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

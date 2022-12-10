docker exec -ti cass_cassandra-node1_1 bash

nodetool status

cqlsh 172.28.0.2 -u cassandra -p password123


  show version
  desc keyspaces;
  use system_views;
  desc tables;

  create keyspace public with replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1};

  drop table click;
  create table click(userId bigint primary key, timestamp text, page text, duration int);

  insert into click (userId, timestamp, page, duration) values (123123, '3242341412', 'help', 100000);
  insert into click (userId, timestamp) values (777777, '3242341412');

  select * from click where userId = 123123;
  select * from click where page = 'help';

  select * from click where page = 'help' allow filtering;

# column oriented data base - we can delete all
  delete page from click where userId = 123123;
  select * from click;
  update click set page = 'market'  where userId = 123123;


  select * from system_views.disk_usage;

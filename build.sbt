ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.12.10"

lazy val root = (project in file("."))
  .settings(
    name := "cassandra-scylla"
  )

// https://mvnrepository.com/artifact/com.datastax.cassandra/cassandra-driver-core
libraryDependencies += "com.datastax.cassandra" % "cassandra-driver-core" % "4.0.0"



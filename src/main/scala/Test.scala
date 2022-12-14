
import com.datastax.oss.driver.api.core.CqlSession
import com.datastax.oss.driver.api.core.CqlSessionBuilder
import com.datastax.oss.driver.api.core.CqlSession
import java.net.InetSocketAddress
import com.datastax.oss.driver.api.core.CqlSession
import com.datastax.oss.driver.api.core.CqlSessionBuilder
import java.net.InetSocketAddress
import com.datastax.oss.driver.api.core.CqlSession
import com.datastax.oss.driver.api.core.CqlIdentifier
import com.datastax.oss.driver.api.core.CqlIdentifier
import com.datastax.oss.driver.api.core.CqlSession


object Test extends App {

  def createSession(node: String, port: Integer, dataCenter: String): CqlSession = {
    val builder = CqlSession.builder
    builder.addContactPoint(new InetSocketAddress(node, port))
    builder.withLocalDatacenter(dataCenter)
    builder.build
  }

  val session = createSession("127.0.0.1", 9042, "datacenter1")

  val rep = KeyspaceRepository(session: CqlSession)

  rep.createKeyspace("from_scala", 1)

  rep.useKeyspace("from_scala")

  session.close()

}

case class KeyspaceRepository(session: CqlSession) {
  def createKeyspace(keyspaceName: String, numberOfReplicas: Int): Unit = {
    session.execute(
      s"""CREATE KEYSPACE IF NOT EXISTS $keyspaceName
         |WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : $numberOfReplicas};""".stripMargin)

  }

  def useKeyspace(keyspace: String): Unit = {
    session.execute(s"USE $keyspace;")
  }

}


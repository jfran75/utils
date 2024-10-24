## script for run kafka
- start kafka and zookeeper
```
zookeeper-server-start.sh config/zookeeper.properties
kafka-server-start.sh config/server.properties 
```

- start kafka KRaft mode
- [example](https://www.conduktor.io/kafka/how-to-install-apache-kafka-on-mac-without-zookeeper-kraft-mode/)
  - 
```

~/kafka_2.13-3.0.0/bin/kafka-storage.sh random-uuid

~/kafka_2.13-3.0.0/bin/kafka-storage.sh format -t <uuid> -c ~/kafka_2.13-3.0.0/config/kraft/server.properties
```

## kafka cli
- se refiere a los scripts que estan en la carpeta bin donde se descomprime kafka
```
kafka-topics.sh -h
kafka-topics.sh --create --topic my-topic --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
```

## install apache kafka at kubernetes(KRaft Mode)
- docs:
  - https://kafka.apache.org/documentation/
- downloads:
  - https://kafka.apache.org/downloads
- ZooKeeper
- KRaft Mode
- Topics
  - Events
  - Partitions
  - Replication
- Producers
- Consumers
- Kafka Connect
  - allows you to continuously ingest data from external systems into Kafka, and vice versa
- Kafka Streams
- Schema Registry
- REST Proxy
- Control Center
- ksqlDB
- kPow

## considerations
  - changes to default configuration(./config/server.properties)
    - set the replication factor to 3
    - set the minimum in-sync replicas to 2(min.insync.replicas=2)
    ![most popular option](most_popular_option.png)
    - retry.backoff.ms=100 (by default is 100ms)
    - delivery.timeout.ms=120000 (by default is 120000ms == 2 minutes)
    - [producer timeouts](image.png)
    - max.in.flight.requests.per.connection=1 (by default is 5)
    - set idempotent producer to true "enable.idempotence=true"
    - check the episode safe kafka producer settings

## compresion at kafka
- https://blog.cloudflare.com/squeezing-the-firehose
- linger.ms=5
- batch.size=16384(16kb)
- compression.type=snappy
- partitioner.class=StickyPartitionCache

## elastic search free cluster
- https://bonsai.io/


## terminology
  - acl: access control list
  - broker: a kafka server
  - cluster: a group of brokers
  - consumer: an application that reads data from kafka
  - producer: an application that writes data to kafka
  - topic: a category or feed name to which records are published
  - partition: a topic is divided into partitions
  - replication: a partition is replicated across multiple brokers
  - offset: a unique identifier of a record within a partition
  - zookeeper: a centralized service for maintaining configuration information and naming
  - acks: the number of acknowledgments the producer requires the leader to have received before considering a request complete


## [install kafka with strimzi](./strimzi/README.md)

## install kafka at kubernetes with helm confluentinc
-  helm chart docs:
  - https://developer.confluent.io/faq/apache-kafka/install-and-run/
  - recommended install
    - https://docs.confluent.io/operator/current/overview.html#operator-about-intro
  - [video](https://www.youtube.com/watch?v=3UUGrBK0BIQ)
  - [github](https://github.com/confluentinc)
  - [github](https://github.com/confluentinc/cp-helm-charts)
  - [github](https://github.com/confluentinc/confluent-kubernetes-examples)
  - [video](https://www.confluent.io/events/kafka-summit-europe-2021/everything-you-ever-needed-to-know-about-kafka-on-kubernetes-but-were-afraid/?session_ref=https://www.google.com/&_ga=2.201394965.584061380.1716473523-1849858196.1716473523&_gac=1.250468724.1716479834.Cj0KCQjw0ruyBhDuARIsANSZ3wqCbQKM7OnKDo124XPe_8T91UJReaB7vK7NxWBCTX-EZLizFE-Kf4kaAvRUEALw_wcB&_gl=1*5al804*_ga*MTg0OTg1ODE5Ni4xNzE2NDczNTIz*_ga_D2D3EGKSGD*MTcxNjQ3OTcwMy4yLjEuMTcxNjQ4MDA0MC42MC4wLjA.)
```
helm repo add confluentinc https://packages.confluent.io/helm
helm repo update
helm repo list
helm show values confluentinc/confluent-for-kubernetes
#helm upgrade --install confluent-operator confluentinc/confluent-for-kubernetes
helm upgrade -n confluent --install operator confluentinc/confluent-for-kubernetes
kubectl get crds | grep confluent
```

## install kafka at kubernetes with helm bitnami chart
- docs:
  - [video](https://www.youtube.com/watch?v=n_vvgc47rWM)
```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo bitnami
helm show values bitnami/kafka
helm install -n kafka -f kafka_values.yaml kafka bitnami/kafka
helm uninstall -n kafka kafka
```

## Notes
- replication factor
  - topics must have a replication factor of 3 (most frecuently)
  - as a rule, for a replication factor of N, you can permanently lose up to N-1 brokers without losing any messages


## recommended sdks
- https://www.conduktor.io/kafka/kafka-sdk-list
- https://github.com/confluentinc/confluent-kafka-dotnet

## advanced topics
- https://www.conduktor.io/kafka/advanced-kafka-consumer-with-java

## run kafka with conduktor(docker compose)
- https://www.conduktor.io/kafka/how-to-start-kafka-using-docker/
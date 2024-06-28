# install apache kafka at kubernetes(KRaft Mode)
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
  - set the replication to 3

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

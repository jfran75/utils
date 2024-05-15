# install redis on premises
- docs:
  - [redis cluster docs](https://redis.io/docs/latest/operate/oss_and_stack/management/scaling/)
  - [github](https://github.com/redis/redis)
  - [example setting redis cluster](https://success.outsystems.com/documentation/how_to_guides/infrastructure/configuring_outsystems_with_redis_in_memory_session_storage/set_up_a_redis_cluster_for_production_environments/)  
  - [example setting redis cluster](https://www.youtube.com/watch?v=ZulHGH4io5E)

## redis ui
  - [redisinsight](https://hub.docker.com/r/redislabs/redisinsight)
    - docker pull redislabs/redisinsight
    - [example docker compose]https://www.youtube.com/watch?v=qucL1F2YEKE

## Redis Sentinel
```
Monitor the state of your Redis Cluster with a set of independent processes.
Manual failover required if you need to promote a replica in another data ce`nter to master.
```

## test redis cluster with ansible and vagrant
- https://github.com/madhur/redis-cluster-vagrant
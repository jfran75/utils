docker run --name=transmission \
--restart=always \
-v /home/jchinchillas/docker/transmission/config:/config \
-v /home/jchinchillas/docker/transmission/downloads:/downloads \
-v /home/jchinchillas/docker/transmission/watch:/watch \
-e PGID=1000 -e PUID=1000 \
-e TZ=America/Mexico_City \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
lscr.io/linuxserver/transmission:latest



http://localhost:9091

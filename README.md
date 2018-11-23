# docker-sonarrv3-armv7
Arm v7 (raspberry pi) of Sonarr V3 preview

docker create \
    --name sonarr \
    -p 8989:8989 \
    -e PUID=<UID> -e PGID=<GID> \
    -e TZ=<timezone> \ 
    -v /etc/localtime:/etc/localtime:ro \
    -v </path/to/appdata>:/config \
    -v <path/to/tvseries>:/tv \
    -v <path/to/downloadclient-downloads>:/downloads \
    fergalmoran/sonarrv3-preview-armv7

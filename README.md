# hazrpg/get-iplayer

[Get_iPlayer](https://github.com/get-iplayer/get_iplayer) A utility for downloading TV and radio programmes from BBC iPlayer, that is currently in active development.

This repo uses the get_iplayer.cgi web frontend that is exposed to port 1935


## Usage

```
docker create \ 
  --name=get-iplayer \
  -v <path to data>:/config \
  -v <path to downoads>:/data \
  -e PGID=<gid> \
  -e PUID=<uid>  \
  -p 1935:1935 \
  hazrpg/get-iplayer
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.'

* `-v /data` Containes get-player show downloads
* `-v /config` Containes get-player config and database
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-p 1935:1935` for mapping the container's port to the host

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Info

* To monitor the logs of the container in realtime `docker logs -f get-iplayer`.

## Versions

+ **2020-10-21:** Inital Release.

## Credits
+ **Linuxserver.io** for dockerfile form, base image, readme outline
+ **binhex** for container form, variable notes and original version
+ **get-iplayer** for this amazing tool, and for the time and effort they spent

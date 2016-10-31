# Whaler bridge

## Setup

### Create container

```sh
$ docker create \
-v /var/run/docker.sock:/var/run/docker.sock \
--name bridge whaler/bridge
```

### Get bridge

```sh
$ docker run -t --rm \
--volumes-from bridge whaler/bridge \
get-bridge
```

OR

```sh
$ docker run -t --rm \
--volumes-from bridge whaler/bridge \
get-bridge `docker version --format '{{.Server.Version}}'`
```

## Usage

### Update whaler.yml

```yaml
services:
    service-a:
        ...
        volumes_from:
            - container:bridge
        ...
    service-b:
        ...
    ...
```

### In service-a

```sh
$ @whaler run service-b.$WHALER_APP [cmd]
```

## License

This software is under the MIT license. See the complete license in:

```
LICENSE
```

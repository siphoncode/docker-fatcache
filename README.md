docker-fatcache
===============

Dockerized fatcache: https://github.com/twitter/fatcache

Example docker-compose declaration
----------------------------------

Paste this into your `compose.yaml` file.

```yaml
fatcache:
  image: getsiphon/fatcache
  tty: true
  devices:
    - "/dev/vda1:/dev/xvda"
```

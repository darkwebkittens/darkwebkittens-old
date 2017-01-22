# CreativeCommonsCatPictures
Work in progress. There'll be a point to this, I promise.

![kitten](https://github.com/ajhaydock/CreativeCommonsCatPictures/raw/master/kitten.jpg)

Deploy site container:
```
docker run --cap-drop=all --name cccp -d -p 80:8080 ajhaydock/cccp
```

Deploy Tor hidden service container:
```
docker run --cap-drop=all --name cccptor -d -v /path/to/onion/service/key:/var/lib/tor/hiddenservice:ro ajhaydock/cccp:tor
```

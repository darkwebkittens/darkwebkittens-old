[![](https://images.microbadger.com/badges/image/ajhaydock/cccp.svg)](https://microbadger.com/images/ajhaydock/cccp "Get your own image badge on microbadger.com")

# CreativeCommonsCatPictures
Work in progress. There'll be a point to this, I promise.

### Deploy Site Container
Container hosted [on Docker Hub](https://hub.docker.com/r/ajhaydock/cccp/).

```
docker run --cap-drop=all --name cccp -p 80:8080 -d ajhaydock/cccp
```

### Deploy Tor Hidden Service Container
Tor Hidden Service deployed using [this container](https://github.com/ajhaydock/CreativeCommonsCatPictures/blob/master/docker-hiddenservice/). It is a container that wraps Tor and nginx together, with nginx running in reverse-proxy mode. This is useful, as nginx can be configured to add in some useful headers that secure the onion service somewhat - and to strip out some headers that might give away too much about our server.
```
docker run --cap-drop=all --name cccptor -v /home/cats/nginx.conf/etc/nginx/nginx.conf:ro -v /home/cats/hiddenservice:/opt/onion/hiddenservice -d ajhaydock/cccptor
```
If you steal this, you will almost certainly want to mount your own version of `nginx.conf` into the container, as I do in the above example (mine points to a local IP and your target is presumably different).

Mounting the `hiddenservice/` directory is optional, but you will want to do this if you have a custom `.onion` URL, or you do not want a new URL every time the container is run.

If you do not mount a `hiddenservice/` dir with a custom `.onion` URL, you can check the `.onion` URL of a running container with:
```
docker exec -it cccptor cat /opt/onion/hiddenservice/hostname
```

If you wish to mount your `nginx.conf` and hidden service directory into the container like I do above, you will need to ensure that they are owned by the uid/gid `1000` on your host.

![kitten](https://github.com/ajhaydock/CreativeCommonsCatPictures/raw/master/kitten.jpg)

### Licenses
#### Image License
All images used on this site are licensed under Creative Commons. Most are from Flickr, and none have been modified.

* Amelia cat [by brownpau on Flickr](https://www.flickr.com/photos/brownpau/14160829306/)
* cat #1399 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/28466850754/)
* cat #1418 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/29842350045/)
* cat #356 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/12374386085/)
* Cat 2 (level adjusted) [by Rahel Schäpper on Flickr](https://www.flickr.com/photos/11000465@N02/1020923340/)
* Cat [by batlettbee on Flickr](https://www.flickr.com/photos/88534689@N08/8726415925/)
* cat [by campb_LLs on Flickr](https://www.flickr.com/photos/n0mi_/6830173403/)
* cat [by ivva on Flickr](https://www.flickr.com/photos/ivva/4646845537/)
* Cat [by Nikodimov on Flickr](https://www.flickr.com/photos/78033337@N00/8312161062/)
* Cat [by Rainer Stropek on Flickr](https://www.flickr.com/photos/rainerstropek/16075613156/)
* Cat [by Tony on Flickr](https://www.flickr.com/photos/zuk0/15218475961/)
* Cat [by Violet Giddings on Flickr](https://www.flickr.com/photos/violetgiddings/31898737835/)
* Cat Photos [by Richard Ricciardi on Flickr](https://www.flickr.com/photos/ricricciardi/9233486351/)
* cat-07358 [by Dorothy on Flickr](https://www.flickr.com/photos/tomatomail/14895989825/)
* cats [by Josh May on Flickr](https://www.flickr.com/photos/chuckles396/4137352612/)
* Cats [by Krzysztof Belczyński on Flickr](https://www.flickr.com/photos/x-oph/6117272430/)
* Cats in the Spring [by zaimoku_woodpile on Flickr](https://www.flickr.com/photos/11250735@N07/8560840635/)
* Catscape Navigator [by wabisabi2015 on Flickr](https://www.flickr.com/photos/necosky/6651575581/)
* Devil's cat [by Thomas on Flickr](https://www.flickr.com/photos/caipirhona/5264164625/)
* Evil Ugly Cat [by Brian Boucheron on Flickr](https://www.flickr.com/photos/bert_m_b/891765178/)
* Fluffy Cat [by TheIntrovert on Flickr](https://www.flickr.com/photos/theintrovert/8669890808/)
* Kitten [by Jennifer C. on Flickr](https://www.flickr.com/photos/29638108@N06/15745379826/)
* Kitten [by Nicole.Kelly on Flickr](https://www.flickr.com/photos/nicolekelly/4671107278/)
* Kitten [by StevenW. on Flickr](https://www.flickr.com/photos/helloeveryone123/6145248102/)
* Kitten! [by Sergey Ivanov on Flickr](https://www.flickr.com/photos/mediumpanda/6157871473/)
* Samouraï, futur geek [by Camille Gévaudan on Flickr](https://www.flickr.com/photos/k-m/4576725680/)

#### Code License
MIT License

Copyright (c) 2017 Alex Haydock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

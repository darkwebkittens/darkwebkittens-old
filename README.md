# CreativeCommonsCatPictures
Work in progress.

There'll be a point to this, I promise.

![kitten](https://github.com/ajhaydock/CreativeCommonsCatPictures/raw/master/kitten.jpg)


### Deploy Site Container
```
docker run --cap-drop=all --name cccp -d -p 80:8080 ajhaydock/cccp
```


### Deploy Tor Hidden Service Container
Please make sure that your hidden service key dir (`/home/cats/hiddenservice` here) contains a valid `private_key` and `hostname` file. Permissions should be set as follows to ensure that the Docker container will not refuse to start:
```
sudo chown -R 100:100 /home/cats/hiddenservice
sudo chmod -R 700 /home/cats/hiddenservice
```

```
docker run --cap-drop=all --name cccptor -d -v /home/cats/hiddenservice:/var/lib/tor/hiddenservice:ro ajhaydock/cccp:tor
```


### Image License
All images used on this site are licensed under Creative Commons. Most are from Flickr, and none have been modified.

* Kitten [by Nicole.Kelly on Flickr](https://www.flickr.com/photos/nicolekelly/4671107278/)
* Kitten! [by Sergey Ivanov on Flickr](https://www.flickr.com/photos/mediumpanda/6157871473/)
* Kitten [by StevenW. on Flickr](https://www.flickr.com/photos/helloeveryone123/6145248102/)
* Kitten [by Jennifer C. on Flickr](https://www.flickr.com/photos/29638108@N06/15745379826/)
* Cat [by Rainer Stropek on Flickr](https://www.flickr.com/photos/rainerstropek/16075613156/)
* cats [by Josh May on Flickr](https://www.flickr.com/photos/chuckles396/4137352612/)
* Cats [by Krzysztof Belczyński on Flickr](https://www.flickr.com/photos/x-oph/6117272430/)
* cat [by ivva on Flickr](https://www.flickr.com/photos/ivva/4646845537/)
* cat [by campb_LLs on Flickr](https://www.flickr.com/photos/n0mi_/6830173403/)
* Cat [by Tony on Flickr](https://www.flickr.com/photos/zuk0/15218475961/)
* Cat [by Nikodimov on Flickr](https://www.flickr.com/photos/78033337@N00/8312161062/)
* Amelia cat [by brownpau on Flickr](https://www.flickr.com/photos/brownpau/14160829306/)
* cat #356 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/12374386085/)
* cat #1418 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/29842350045/)
* cat #1399 [by K-nekoTR on Flickr](https://www.flickr.com/photos/105567585@N06/28466850754/)
* Cat [by batlettbee on Flickr](https://www.flickr.com/photos/88534689@N08/8726415925/)
* Cat [by Violet Giddings on Flickr](https://www.flickr.com/photos/violetgiddings/31898737835/)
* Fluffy Cat [by TheIntrovert on Flickr](https://www.flickr.com/photos/theintrovert/8669890808/)
* Cat Photos [by Richard Ricciardi on Flickr](https://www.flickr.com/photos/ricricciardi/9233486351/)
* cat-07358 [by Dorothy on Flickr](https://www.flickr.com/photos/tomatomail/14895989825/)
* Devil's cat [by Thomas on Flickr](https://www.flickr.com/photos/caipirhona/5264164625/)
* Evil Ugly Cat [by Brian Boucheron on Flickr](https://www.flickr.com/photos/bert_m_b/891765178/)
* Cat 2 (level adjusted) [by Rahel Schäpper on Flickr](https://www.flickr.com/photos/11000465@N02/1020923340/)
* Cats in the Spring [by zaimoku_woodpile on Flickr](https://www.flickr.com/photos/11250735@N07/8560840635/)
* Catscape Navigator [by wabisabi2015 on Flickr](https://www.flickr.com/photos/necosky/6651575581/)
* Samouraï, futur geek [by Camille Gévaudan on Flickr](https://www.flickr.com/photos/k-m/4576725680/)


### Code License
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

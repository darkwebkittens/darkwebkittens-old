# CreativeCommonsCatPictures
Work in progress. There'll be a point to this, I promise.

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
All images used on this site are licensed under Creative Commons. Most are from
Flickr, and none have been modified. Where an image requires attribution, please
find information about the author in the ATTRIBUTION.md file in this repository.

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

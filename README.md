TiNowPlaying [![Titanium](http://www-static.appcelerator.com/badges/titanium-git-badge-sq.png)](http://www.appcelerator.com/titanium/)
===
This module allows you to set song attributes and handle remote controls events (Lockscreen or Control Center) on your iOS app using Titanium.

Download
===
Download the compiled release [here](https://github.com/bguidolim/TiPlayingInfo/tree/master/dist) or install from gitTio    [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/com.guidolim.TiNowPlaying)

How to Use
===
```javascript
var nowPlaying = require('com.guidolim.TiNowPlaying');

//Set "Now Playing" info
nowPlaying.setInfo({
  artistName: 'Artist Name',
  songTitle: 'Song Name',
  albumTitle: 'Album Title',
  albumCover: Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, 'albumCover.png').nativePath()
});
//You also set a remote image for album cover.

//Clear "Now Playing" info
nowPlaying.clear();

//Handle remote control events
nowPlaying.addEventListener('RemoteControl', function(e) {
  Ti.API.debug('remote control event was fired!');
  switch (e.action) {
    case nowPlaying.PLAY:
      Ti.API.info("Remote Control: PLAY");
      break;
    case nowPlaying.PAUSE:
      Ti.API.info("Remote Control: PAUSE");
      break;
    case nowPlaying.STOP:
      Ti.API.info("Remote Control: STOP");
      break;
    case nowPlaying.PLAY_PAUSE:
      Ti.API.info("Remote Control: PLAY_PAUSE");
      break;
    case nowPlaying.PREV:
      Ti.API.info("Remote Control: PREV");
      break;
    case nowPlaying.NEXT:
      Ti.API.info("Remote Control: NEXT");
      break;
    case nowPlaying.START_SEEK_BACK:
      Ti.API.info("Remote Control: START_SEEK_BACK");
      break;
    case nowPlaying.END_SEEK_BACK:
      Ti.API.info("Remote Control: END_SEEK_BACK");
      break;
    case nowPlaying.START_SEEK_FORWARD:
      Ti.API.info("Remote Control: START_SEEK_FORWARD");
      break;
    case nowPlaying.END_SEEK_FORWARD:
      Ti.API.info("Remote Control: END_SEEK_FORWARD");
      break;
  }
});
```

Contributions
===
Feel free to fork the repo, optimize and make a pull request. :-)

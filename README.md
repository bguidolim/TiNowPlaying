TiPlayingInfo
===
This module allows you to set song attributes and handle remote controls events (Lockscreen or Control Center) on your iOS app using Titanium.

Download
===
Download the compiled release [here](https://github.com/bguidolim/TiPlayingInfo/tree/master/dist).

How to Use
===
```javascript
var PlayingInfo = require('com.guidolim.TiNowPlaying');

//Set "Now Playing" info
PlayingInfo.setInfo({
  artistName: 'Artist Name',
  songTitle: 'Song Name',
  albumTitle: 'Album Title',
  albumCover: 'albumCover.png'
});

//Clear "Now Playing" info
PlayingInfo.clear();

//Handle remote control events
PlayingInfo.addEventListener('RemoteControl', function(e) {
  Ti.API.debug('remote control event was fired!');
  switch (e.action) {
    case PlayingInfo.PLAY:
      Ti.API.info("Remote Control: PLAY");
      break;
    case PlayingInfo.PAUSE:
      Ti.API.info("Remote Control: PAUSE");
      break;
    case PlayingInfo.STOP:
      Ti.API.info("Remote Control: STOP");
      break;
    case PlayingInfo.PLAY_PAUSE:
      Ti.API.info("Remote Control: PLAY_PAUSE");
      break;
    case PlayingInfo.PREV:
      Ti.API.info("Remote Control: PREV");
      break;
    case PlayingInfo.:
      Ti.API.info("Remote Control: NEXT");
      break;
    case PlayingInfo.START_SEEK_BACK:
      Ti.API.info("Remote Control: START_SEEK_BACK");
      break;
    case PlayingInfo.END_SEEK_BACK:
      Ti.API.info("Remote Control: END_SEEK_BACK");
      break;
    case PlayingInfo.START_SEEK_FORWARD:
      Ti.API.info("Remote Control: START_SEEK_FORWARD");
      break;
    case PlayingInfo.END_SEEK_FORWARD:
      Ti.API.info("Remote Control: END_SEEK_FORWARD");
      break;
  }
});
```

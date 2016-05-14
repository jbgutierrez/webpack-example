console = require('logger').for('video-page')

{ Video } = require 'video'
video = new Video 'http://vjs.zencdn.net/oceans-clip.mp4', 'http://video-js.zencoder.com/oceans-clip.png'

video.play()

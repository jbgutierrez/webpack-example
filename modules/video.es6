/* jshint esversion: 6 */
require("video.scss");
const console = require('logger').for("video");
console.log("load");

var videojs = require('videojs/dist/video.js'),
    $ = require('jquery');

export class Video {
    constructor(url, poster) {
        this.name = name;
        var tmpl = `
        <video id="example_video_1" class="video-js vjs-default-skin"
          controls preload="auto" width="640" height="264"
          poster="${poster}"
          data-setup='{"example_option":true}'>
         <source src="${url}" type="video/mp4" />
         <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
        </video>
        `
        var $video = $(tmpl);
        $('#main').prepend($video);
    }
    play() {
        console.log(`playing ${this.name}`);
        videojs("example_video_1", {}, function(){
          // Player (this) is initialized and ready.
        });
    }
}

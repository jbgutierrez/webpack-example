/* jshint esversion: 6 */
require("video.scss");
const console = require('logger').for("video");
console.log("load");

export class Video {
    constructor(name) {
        this.name = name;
    }
    play() {
        console.log(`playing ${this.name}`);
    }
}

/*
# graph-cluster-name: core
*/
/* jshint esversion: 6 */
const MODULE_NAME = 'video'
const console = require('logger').for(MODULE_NAME);
console.log("load");

require("video.scss");
export class Video {
    constructor(name) {
        this.name = name;
    }
    play() {
        console.log(`playing ${this.name}`);
    }
}

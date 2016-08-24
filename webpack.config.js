var path    = require('path'),
    webpack = require('webpack'),
    LiveReloadPlugin = require('webpack-livereload-plugin'),
    ExtractTextPlugin = require("extract-text-webpack-plugin");

function contextFor(channel, externals) {
    return {
        context: path.join(__dirname, 'js'),
        name: channel,
        entry: {
            main: './main'
        },
        output: {
            path: path.join(__dirname, 'builds'),
            filename: channel + ".js",
            chunkFilename: path.join("chunks", channel + ".[chunkhash].chunk.js")
        },
        module: {
            loaders: [
                { test: /\.coffee$/, loader: 'coffee-loader' },
                { test: /\.json$/, loader: 'json-loader' },
                { test: /\.scss$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader!sass-loader") },
                { test: /\.es6$/, loader: 'babel', query: { presets: ['es2015'] } }
            ]
        },
        sassLoader: {
            includePaths: [path.resolve(__dirname, "./node_modules/compass-mixins/lib")]
        },
        resolve: {
            extensions: ["", ".coffee", ".es6"],
            modulesDirectories: [
              // It will allow to use path without leading `./` in require
              // for directories placed in `app`:
              'js',
              'css'
            ],
            root: './bower_components'
        },
        externals: externals,
        plugins: [
            new ExtractTextPlugin(channel + ".css"),
            new webpack.optimize.CommonsChunkPlugin({
                children: true,
                minChunks: function(module, count){
                    return (count > 2 && module.size() < 128) ||
                            ~module._source._value.indexOf('promote: true');
                }
            }),
            new webpack.DefinePlugin({
                ENV: JSON.stringify(channel)
            }),
            new LiveReloadPlugin({
                appendScriptTag:true
            })
        ]
    }
}

module.exports = [
    contextFor('mobile', {
        // "jquery": "Zepto"
    }),
    contextFor('desktop', {
        // "jquery": "jQuery"
    })
]

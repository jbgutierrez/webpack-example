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
        devServer: {
            host: '0.0.0.0',
            port: 8081,
            publicPath: "/"
        },
        module: {
            loaders: [
                { test: /\.html$/, loader: 'html' },
                { test: /\.coffee$/, loader: 'coffee-loader' },
                { test: /\.json$/, loader: 'json-loader' },
                { test: /\.scss$/, loader: ExtractTextPlugin.extract("style-loader", "css!sass"), exclude: /\.useable\.scss$/ },
                { test: /\.useable\.scss$/, loader: ExtractTextPlugin.extract("style/useable", "css!sass") },
                { test: /\.es6$/, loader: 'babel', query: { presets: ['es2015'] } },
                { test: /\.(png|jpg|jpeg|gif|ttf|eot|svg|woff(2)?)(\?[a-z0-9=&.]+)?$/, loader : 'file-loader' }
            ]
        },
        sassLoader: {
            includePaths: [path.resolve(__dirname, "./node_modules/compass-mixins/lib")]
        },
        resolve: {
            extensions: ["", ".coffee", ".es6", ".json"],
            modulesDirectories: [
              // It will allow to use path without leading `./` in require
              // for directories placed in `app`:
              'contents',
              'js',
              'css'
            ],
            root: './bower_components'
        },
        externals: externals,
        plugins: [
            new ExtractTextPlugin(channel + ".css"),
            new webpack.DefinePlugin({
                ENV: JSON.stringify(channel)
            }),
            new LiveReloadPlugin({
                appendScriptTag: true,
                port: 35731
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

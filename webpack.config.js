var fs      = require('fs'),
    path    = require('path'),
    webpack = require('webpack');

function loadManifest(manifestFile) {
    var alias = {},
        modules = JSON.parse(fs.readFileSync(manifestFile)),
        moduleName, version;

    for (moduleName in modules) {
        version = modules[moduleName].replace('=', '');
        alias[moduleName] = path.join(__dirname, 'modules/versions/' + moduleName + '-v.' + version);
    }

    return alias;
}

function contextFor(channel, externals) {
    return {
        context: path.join(__dirname, 'modules'),
        name: channel,
        entry: {
            router: './router'
        },
        output: {
            path: path.join(__dirname, 'builds'),
            filename: channel + ".js",
            chunkFilename: path.join("chunks", channel + ".[chunkhash].chunk.js")
        },
        module: {
            loaders: [
                { test: /\.coffee$/, loader: 'coffee-loader' },
                { test: /\.json$/, loader: 'json-loader' }
            ]
        },
        resolve: {
            extensions: ["", ".coffee"],
            alias: loadManifest('versions.manifest.json')
        },
        externals: externals,
        resolveLoader: { root: path.join(__dirname, "nosync/node_modules") },
        plugins: [
            new webpack.optimize.CommonsChunkPlugin({
                children: true,
                minChunks: function(module, count){
                    return (count > 2 && module.size() < 128) ||
                            ~module._source._value.indexOf('promote: true');
                }
            }),
            new webpack.DefinePlugin({
                ENV: JSON.stringify(channel)
            })
        ]
    }
}
module.exports = [
    contextFor('mobile', {
        "jquery": "Zepto"
    }),
    contextFor('desktop', {
        "jquery": "jQuery"
    })
]

var fs      = require('fs'),
    path    = require('path'),
    webpack = require('webpack'),
    version, alias = {};

function loadManifest(manifestFile) {
    var manifestFile = [__dirname, 'versions.manifest.json'].join(path.sep),
        config = JSON.parse(fs.readFileSync(manifestFile)),
        modules = config.modules,
        moduleName, moduleVersion;

    for (moduleName in modules) {
        moduleVersion = modules[moduleName].replace('=', '');
        alias[moduleName] = path.join(__dirname, 'modules/versions/' + moduleName + '-v.' + moduleVersion);
    }

    version = config.annotations.$version.split('@')[0]
}

loadManifest();

function contextFor(channel, externals) {
    return {
        context: path.join(__dirname, 'modules'),
        name: channel,
        entry: {
            router: './router'
        },
        output: {
            path: path.join(__dirname, 'builds'),
            filename: channel + "-v." + version + ".js",
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
            alias: alias
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

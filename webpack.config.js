var path    = require('path'),
    webpack = require('webpack');

function contextFor(channel) {
    return {
        context: path.join(__dirname, 'modules'),
        name: channel,
        entry: {
            router: './router.coffee'
        },
        output: {
            path: path.join(__dirname, 'builds'),
            filename: channel + ".js",
            chunkFilename: channel + ".[id].chunk.js"
        },
        module: {
            loaders: [
                { test: /\.coffee$/, loader: 'coffee-loader' },
                { test: /\.json$/, loader: 'json-loader' }
            ]
        },
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
    contextFor('mobile'),
    contextFor('desktop')
]

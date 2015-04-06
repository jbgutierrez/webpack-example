var path    = require('path'),
    webpack = require('webpack');

module.exports = {
    context: path.join(__dirname, 'modules'),
    entry: {
      router: './router.coffee'
    },
    output: {
      path: path.join(__dirname, 'builds'),
      filename: "[name].js",
      chunkFilename: "[name].chunk.js"
    },
    module: {
      loaders: [
        { test: /\.coffee$/, loader: 'coffee-loader' },
        { test: /\.json$/, loader: 'json-loader' }
      ]
    },
    plugins: [
        new webpack.optimize.CommonsChunkPlugin({
            children: true
        })
        // ,
        // new webpack.optimize.LimitChunkCountPlugin({ maxChunks: 1 })
    ]
};

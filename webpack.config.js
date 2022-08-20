const path = require('path')
const HTMLWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: './frontend/src/index.js',

  output: {
    path: path.resolve(__dirname, './frontend/static/frontend'),
    filename: '[name].js'
  },

  // plugins: [
  //     new HTMLWebpackPlugin({
  //         template: './frontend/src/index.html'
  //     })
  // ],

  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        }
      }
    ]
  },
  resolve: {
    extensions: ['*', '.js', '.jsx']
  }
}

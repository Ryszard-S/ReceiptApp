const path = require('path')
const HTMLWebpackPlugin = require('html-webpack-plugin')
const { ProvidePlugin } = require('webpack')

module.exports = {
  entry: './frontend/src/index.js',

  output: {
    path: path.resolve(__dirname, './frontend/static/frontend'),
    filename: '[name].js'
  },

  plugins: [
    new HTMLWebpackPlugin({
      template: './frontend/src/index.html'
    }),
    new ProvidePlugin({
      React: 'react' // automatically import react where needed
    })
  ],

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
  },
  devServer: {
    compress: true,
    historyApiFallback: true,
    open: true
  }
}

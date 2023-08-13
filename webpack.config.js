const path = require('path')
const HTMLWebpackPlugin = require('html-webpack-plugin')
const { ProvidePlugin, HotModuleReplacementPlugin } = require('webpack')
const Dotenv = require('dotenv-webpack')

module.exports = {
  entry: './frontend/src/index.js',

  output: {
    path: path.resolve(__dirname, './frontend/static/frontend'),
    filename: '[name].js',
    publicPath: path.resolve(__dirname, './frontend/static/frontend')
  },

  plugins: [
    // new HTMLWebpackPlugin({
    //   template: './frontend/src/index.html',
    //   favicon: './frontend/static/favicon-32x32.png'
    // }),
    new ProvidePlugin({
      React: 'react' // automatically import react where needed
    }),
    new Dotenv()
  ],
  devtool: 'source-map',
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
  cache: {
    type: 'filesystem'
  },
  devServer: {
    compress: false,
    historyApiFallback: true,
    open: true,
    hot: true
  }
}

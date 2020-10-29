const path = require('path');

// all
const { DefinePlugin } = require('webpack');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const WebpackBar = require('webpackbar');

// prod
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');

const isDev = process.env.NODE_ENV != 'production';
const context = path.resolve(__dirname, 'app');

const entry = {
  app: path.resolve(context, 'index.js'),
};

const resolve = {
  alias: {
    '@': context,
  },
};

let output = {};
{
  if (isDev) {
    output = {
      path: path.resolve(__dirname, 'dev'),
      filename: 'index.js',
    };
  } else {
    output = {
      path: path.resolve(__dirname, 'dist'),
      filename: '[contenthash].js',
      jsonpFunction: 'a',
    };
  }
}
// =========================================================================
// LOADERS
// =========================================================================
const babelLoader = {
  test: /\.js$/,
  exclude: [/node_modules\/(webpack|html-webpack-plugin)/, /node_modules\/core-js.*/s],
  loader: 'babel-loader',
  options: { cacheDirectory: isDev },
};
{
  if (isDev) {
  } else {
  }
}

const fileLoader = {
  test: /\.(png|jpe?g|gif|svg)$/i,
  loader: 'file-loader',
  options: {
    outputPath: 'assets',
    name: '[path][name].[ext]',
    esModule: false,
  },
};
{
  if (isDev) {
    fileLoader.options.name = '[path][name].[ext]';
  } else {
    fileLoader.options.name = '[contenthash].[ext]';
  }
}

const cssLoader = {
  test: /\.s[ac]ss$|\.css$/,
  use: [
    {
      loader: MiniCssExtractPlugin.loader,
      options: { hmr: isDev },
    },
    'css-loader',

    {
      loader: 'postcss-loader',
      options: {
        postcssOptions: {
          plugins: [require('postcss-import')(), require('postcss-preset-env')(), require('autoprefixer')()],
        },
      },
    },

    'sass-loader',
  ],
};

const rules = [babelLoader, fileLoader, cssLoader];

// =========================================================================
// PLUGINS
// =========================================================================
let htmlWebpackPluginOptions = {
  template: path.resolve(context, 'public/index.html'),
};
{
  if (isDev) {
  } else {
    htmlWebpackPluginOptions.minify = {
      collapseWhitespace: true,
      removeComments: true,
      removeRedundantAttributes: true,
      removeScriptTypeAttributes: true,
      removeStyleLinkTypeAttributes: true,
      useShortDoctype: true,
    };
  }
}

let miniCssExtractPluginOptions = {};
{
  if (isDev) {
    miniCssExtractPluginOptions.filename = '[name].css';
  } else {
    miniCssExtractPluginOptions.filename = '[contenthash].css';
  }
}

let definePluginOptions = {
  __IS_DEV__: isDev,
};
{
  if (isDev) {
  } else {
  }
}

const plugins = [
  new CleanWebpackPlugin(),
  new WebpackBar(),
  new DefinePlugin(definePluginOptions),
  new HtmlWebpackPlugin(htmlWebpackPluginOptions),
  new MiniCssExtractPlugin(miniCssExtractPluginOptions),
];
{
  if (isDev) {
  } else {
    plugins.push(new OptimizeCssAssetsPlugin());
  }
}

// =========================================================================
// OPTIMIZATION
// =========================================================================
let optimization = {};
{
  if (isDev) {
    optimization = {
      runtimeChunk: 'single',
      splitChunks: {
        chunks: 'all',
        maxInitialRequests: Infinity,
        minSize: 0,
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/](.*?)([\\/]|$)/,
            name: (module) => {
              const packageName = module.context.match(/[\\/]node_modules[\\/](.*?)([\\/]|$)/)[1];
              if (packageName[0] == '.') return `z${packageName.replace('@', '')}`;
              else return `z.${packageName.replace('@', '')}`;
            },
          },
        },
      },
    };
  } else {
    optimization = {
      minimize: true,
      runtimeChunk: 'single',
      splitChunks: {
        chunks: 'all',
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/](.*?)([\\/]|$)/,
            name: (module) => {
              const packageName = module.context.match(/[\\/]node_modules[\\/](.*?)([\\/]|$)/)[1];
              return packageName;
            },
          },
        },
      },
    };
  }
}

// =========================================================================
// dev server
// =========================================================================
const devServer = {
  contentBase: path.join(context),
  publicPath: '/',
  index: './index.html',
  hot: true,
  writeToDisk: true,
  clientLogLevel: 'error',
  overlay: {
    warnings: false,
    errors: true,
  },
  historyApiFallback: true,
};

module.exports = {
  mode: isDev ? 'development' : 'production',
  devtool: isDev ? 'source-map' : undefined,
  stats: isDev ? 'minimal' : undefined,
  devServer: isDev ? devServer : undefined,
  module: { rules },

  entry,
  output,
  resolve,

  plugins,
  optimization,
};

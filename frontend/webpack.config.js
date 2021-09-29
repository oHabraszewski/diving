const path = require('path');

// all
const { DefinePlugin } = require('webpack');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

const { VueLoaderPlugin } = require('vue-loader')
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const FaviconsWebpackPlugin = require('favicons-webpack-plugin')

const WebpackBar = require('webpackbar');

// prod
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');

const isDev = process.env.NODE_ENV != 'production';
const context = path.resolve(__dirname, 'src');
const assetsPath = path.resolve(__dirname, 'assets');

let publicLoc;
if(isDev){
  publicLoc = "../server/target/classes/public"
}else{
  publicLoc = "../server/src/main/resources/public"
}

const entry = {
  index: path.resolve(context, 'index.js'),
  credits: path.resolve(context, 'credits.js'),
  technical: path.resolve(context, 'technical.js'),
  register: path.resolve(context, 'register.js')
};

const resolve = {
  alias: {
    '@': context,
    'assets': assetsPath,
    'vue$': 'vue/dist/vue.esm-bundler.js'
  },
};

let output = {};
{
  if (isDev) {
    output = {
      path: path.resolve(__dirname, publicLoc),
      filename: '[name].bundle.js',
    };
  } else {
    output = {
      path: path.resolve(__dirname, publicLoc),
      filename: '[contenthash].js', 
      jsonpFunction: 'a',
    };
  }
}
// =========================================================================
// LOADERS
// =========================================================================
const vueLoader = {
  test: /\.vue$/,
  loader: 'vue-loader'
}

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
  test: /\.(png|jpe?g|gif|svg|ttf|woff)$/i,
  loader: 'file-loader',
  options: {
    outputPath: '',
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
      //options: { hmr: isDev },
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

const rules = [/*babelLoader,*/ vueLoader, fileLoader, cssLoader];

// =========================================================================
// PLUGINS
// =========================================================================
let htmlWebpackPluginsOptions = [
  {
    filename: "index.html",
    template: path.resolve(context, 'html/index.html'),
    chunks: ["index"]
  },
  {
    filename: "credits.html",
    template: path.resolve(context, 'html/credits.html'),
    chunks: ["credits"]
  },
  {
    filename: "technical.html",
    template: path.resolve(context, 'html/technical.html'),
    chunks: ["technical"]
  },
  {
    filename: "register.html",
    template: path.resolve(context, 'html/register.html'),
    chunks: ["register"]
  }
];
{
  if (isDev) {
  } else {
    htmlWebpackPluginsOptions.forEach((plugin)=>{
      plugin.minify = {
        collapseWhitespace: true,
        removeComments: true,
        removeRedundantAttributes: true,
        removeScriptTypeAttributes: true,
        removeStyleLinkTypeAttributes: true,
        useShortDoctype: true,
      }
    })
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
  if (isDev) { // WTF is this??? Are you drunk?
  } else {
  }
}

const plugins = [
 // new CleanWebpackPlugin(),
  new WebpackBar(),
  new VueLoaderPlugin(),
  new DefinePlugin(definePluginOptions),
  new HtmlWebpackPlugin(htmlWebpackPluginsOptions[0]),
  new HtmlWebpackPlugin(htmlWebpackPluginsOptions[1]),
  new HtmlWebpackPlugin(htmlWebpackPluginsOptions[2]),  
  new HtmlWebpackPlugin(htmlWebpackPluginsOptions[3]), 
  new MiniCssExtractPlugin(miniCssExtractPluginOptions),
  new FaviconsWebpackPlugin(path.resolve(assetsPath, 'img/favicon.png')) //TODO: new icon -> change path
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
      //runtimeChunk: 'single',
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
// const devServer = {
//   contentBase: path.join(context),
//   open: true,
//   openPage: 'http://localhost:8080',
//   publicPath: '/',
//   port: 8081,
//   index: './index.html',
//   hot: true,
//   writeToDisk: true,
//   clientLogLevel: 'error',
//   overlay: {
//     warnings: false,
//     errors: true,
//   },
//   historyApiFallback: true,
// };

module.exports = {
  mode: isDev ? 'development' : 'production',
  devtool: isDev ? 'source-map' : undefined,
  stats: isDev ? 'minimal' : undefined,
  watch: isDev,
  watchOptions: {
    aggregateTimeout: 400,
    ignored: /node_modules/,
  },
  module: { rules },

  entry,
  output,
  resolve,

  plugins,
  optimization,
};

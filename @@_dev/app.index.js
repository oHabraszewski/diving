(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["app"],{

/***/ "./app/game.js":
/*!*********************!*\
  !*** ./app/game.js ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var phaser__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! phaser */ "./node_modules/phaser/dist/phaser.js");
/* harmony import */ var phaser__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(phaser__WEBPACK_IMPORTED_MODULE_0__);

var config = {
  type: phaser__WEBPACK_IMPORTED_MODULE_0___default.a.AUTO,
  width: 1920,
  height: 1080,
  physics: {
    "default": 'arcade',
    arcade: {
      gravity: {
        y: -180
      }
    }
  },
  scene: {
    preload: preload,
    create: create,
    update: update
  }
};
var game = new phaser__WEBPACK_IMPORTED_MODULE_0___default.a.Game(config);
var nurek;
var atmosfera;

function preload() {
  this.load.image('nurek', './assets/nurek.png');
}

function create() {
  var woda = this.add.rectangle(0, 101, 800, 600, 0x2020c0);
  woda.setOrigin(0, 0);
  atmosfera = this.add.rectangle(0, 0, 800, 100, 0xe0e0f0);
  atmosfera.setOrigin(0, 0);
  this.physics.add.existing(atmosfera);
  atmosfera.body.setCollideWorldBounds();
  nurek = this.physics.add.sprite(100, 100, 'nurek');
  nurek.setBounce(0.2);
  nurek.setCollideWorldBounds(true);
  this.physics.add.collider(nurek, atmosfera);
}

function update() {
  var cursors = this.input.keyboard.createCursorKeys();

  if (cursors.right.isDown) {
    nurek.setVelocityX(10);
  }

  if (cursors.left.isDown) {
    nurek.setVelocityX(-10);
  }

  if (cursors.down.isDown) {
    nurek.setVelocityY(100);
  }
}

/***/ }),

/***/ "./app/index.js":
/*!**********************!*\
  !*** ./app/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _main_scss__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./main.scss */ "./app/main.scss");
/* harmony import */ var _main_scss__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_main_scss__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _game_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./game.js */ "./app/game.js");



/***/ }),

/***/ "./app/main.scss":
/*!***********************!*\
  !*** ./app/main.scss ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/mini-css-extract-plugin/dist/loader.js):\nTypeError: $ is not a function\n    at Object../node_modules/core-js/modules/es.array.is-array.js (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:4167:1)\n    at __webpack_require__ (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:21:30)\n    at Object../node_modules/core-js/internals/is-array.js (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:2270:1)\n    at __webpack_require__ (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:21:30)\n    at Object../node_modules/core-js/modules/es.array.concat.js (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:3884:15)\n    at __webpack_require__ (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:21:30)\n    at Object../node_modules/core-js/modules/es.string.replace.js (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:5287:1)\n    at __webpack_require__ (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:21:30)\n    at Object../node_modules/core-js/modules/es.regexp.constructor.js (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:4944:1)\n    at __webpack_require__ (E:\\02_Source\\Web\\sfn2021\\node_modules\\css-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\node_modules\\postcss-loader\\dist\\cjs.js??ref--6-2!E:\\02_Source\\Web\\sfn2021\\node_modules\\sass-loader\\dist\\cjs.js!E:\\02_Source\\Web\\sfn2021\\app\\main.scss:21:30)");

/***/ }),

/***/ "./node_modules/webpack/hot sync ^\\.\\/log$":
/*!*************************************************!*\
  !*** (webpack)/hot sync nonrecursive ^\.\/log$ ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var map = {
	"./log": "./node_modules/webpack/hot/log.js"
};


function webpackContext(req) {
	var id = webpackContextResolve(req);
	return __webpack_require__(id);
}
function webpackContextResolve(req) {
	if(!__webpack_require__.o(map, req)) {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	}
	return map[req];
}
webpackContext.keys = function webpackContextKeys() {
	return Object.keys(map);
};
webpackContext.resolve = webpackContextResolve;
module.exports = webpackContext;
webpackContext.id = "./node_modules/webpack/hot sync ^\\.\\/log$";

/***/ }),

/***/ 0:
/*!**********************************************************************************************************!*\
  !*** multi (webpack)-dev-server/client?http://localhost:8080 (webpack)/hot/dev-server.js ./app/index.js ***!
  \**********************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(/*! E:\02_Source\Web\sfn2021\node_modules\webpack-dev-server\client\index.js?http://localhost:8080 */"./node_modules/webpack-dev-server/client/index.js?http://localhost:8080");
__webpack_require__(/*! E:\02_Source\Web\sfn2021\node_modules\webpack\hot\dev-server.js */"./node_modules/webpack/hot/dev-server.js");
module.exports = __webpack_require__(/*! E:\02_Source\Web\sfn2021\app\index.js */"./app/index.js");


/***/ })

},[[0,"runtime","z.core-js","z.webpack-dev-server","z.webpack","z.html-entities","z.querystring-es3","z.url","z.ansi-html","z.events","z.loglevel","z.node-libs-browser","z.phaser","z.sockjs-client"]]]);
//# sourceMappingURL=app.index.js.map
/******/ (function(modules) { // webpackBootstrap
/******/ 	// install a JSONP callback for chunk loading
/******/ 	function webpackJsonpCallback(data) {
/******/ 		var chunkIds = data[0];
/******/ 		var moreModules = data[1];
/******/ 		var executeModules = data[2];
/******/
/******/ 		// add "moreModules" to the modules object,
/******/ 		// then flag all "chunkIds" as loaded and fire callback
/******/ 		var moduleId, chunkId, i = 0, resolves = [];
/******/ 		for(;i < chunkIds.length; i++) {
/******/ 			chunkId = chunkIds[i];
/******/ 			if(Object.prototype.hasOwnProperty.call(installedChunks, chunkId) && installedChunks[chunkId]) {
/******/ 				resolves.push(installedChunks[chunkId][0]);
/******/ 			}
/******/ 			installedChunks[chunkId] = 0;
/******/ 		}
/******/ 		for(moduleId in moreModules) {
/******/ 			if(Object.prototype.hasOwnProperty.call(moreModules, moduleId)) {
/******/ 				modules[moduleId] = moreModules[moduleId];
/******/ 			}
/******/ 		}
/******/ 		if(parentJsonpFunction) parentJsonpFunction(data);
/******/
/******/ 		while(resolves.length) {
/******/ 			resolves.shift()();
/******/ 		}
/******/
/******/ 		// add entry modules from loaded chunk to deferred list
/******/ 		deferredModules.push.apply(deferredModules, executeModules || []);
/******/
/******/ 		// run deferred modules when all chunks ready
/******/ 		return checkDeferredModules();
/******/ 	};
/******/ 	function checkDeferredModules() {
/******/ 		var result;
/******/ 		for(var i = 0; i < deferredModules.length; i++) {
/******/ 			var deferredModule = deferredModules[i];
/******/ 			var fulfilled = true;
/******/ 			for(var j = 1; j < deferredModule.length; j++) {
/******/ 				var depId = deferredModule[j];
/******/ 				if(installedChunks[depId] !== 0) fulfilled = false;
/******/ 			}
/******/ 			if(fulfilled) {
/******/ 				deferredModules.splice(i--, 1);
/******/ 				result = __webpack_require__(__webpack_require__.s = deferredModule[0]);
/******/ 			}
/******/ 		}
/******/
/******/ 		return result;
/******/ 	}
/******/
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// object to store loaded and loading chunks
/******/ 	// undefined = chunk not loaded, null = chunk preloaded/prefetched
/******/ 	// Promise = chunk loading, 0 = chunk loaded
/******/ 	var installedChunks = {
/******/ 		"register": 0
/******/ 	};
/******/
/******/ 	var deferredModules = [];
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	var jsonpArray = window["webpackJsonp"] = window["webpackJsonp"] || [];
/******/ 	var oldJsonpFunction = jsonpArray.push.bind(jsonpArray);
/******/ 	jsonpArray.push = webpackJsonpCallback;
/******/ 	jsonpArray = jsonpArray.slice();
/******/ 	for(var i = 0; i < jsonpArray.length; i++) webpackJsonpCallback(jsonpArray[i]);
/******/ 	var parentJsonpFunction = oldJsonpFunction;
/******/
/******/
/******/ 	// add entry module to deferred list
/******/ 	deferredModules.push(["./src/register.js","z.vue","z.webpack","z.axios","z.process","z.vuex","credits~index~register~technical","index~register"]);
/******/ 	// run deferred modules when ready
/******/ 	return checkDeferredModules();
/******/ })
/************************************************************************/
/******/ ({

/***/ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true":
/*!*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js??ref--2-2!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist??ref--8-0!./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true ***!
  \*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=script&lang=js":
/*!***********************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist??ref--8-0!./src/vue/Register.vue?vue&type=script&lang=js ***!
  \***********************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _components_Button_vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./components/Button.vue */ "./src/vue/components/Button.vue");
/* harmony import */ var _components_Input_vue__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./components/Input.vue */ "./src/vue/components/Input.vue");
/* harmony import */ var _js_utils_connectAxios_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../js/utils/connectAxios.js */ "./src/js/utils/connectAxios.js");
/* harmony import */ var _js_utils_ConfigVars_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../js/utils/ConfigVars.js */ "./src/js/utils/ConfigVars.js");

    
    

    
    


    /* harmony default export */ __webpack_exports__["default"] = ({
        components: {
            ButtonVue: _components_Button_vue__WEBPACK_IMPORTED_MODULE_0__["default"],
            InputVue: _components_Input_vue__WEBPACK_IMPORTED_MODULE_1__["default"]
        },
        data(){
            return {
                username: "",
                password: "",
                email: "",
                error: "",
                success: false
            }
        },
        methods: {
            setUsername(value){
                this.username=value
            },
            setPassword(value){
                this.password=value
            },
            setEmail(value){
                this.email=value
            },
            validateData(){
                this.sendData()
            },
            async sendData(){
                const response = await Object(_js_utils_connectAxios_js__WEBPACK_IMPORTED_MODULE_2__["default"])(_js_utils_ConfigVars_js__WEBPACK_IMPORTED_MODULE_3__["default"].HOSTNAME + _js_utils_ConfigVars_js__WEBPACK_IMPORTED_MODULE_3__["default"].API_PREFIX + "/rls/register",{ 
                    username: this.username,
                    password: this.password,
                    email: this.email
                })

                this.success = response.data.success;

                if(!this.success){
                        this.error = response.data.error

                        console.warn("Register data validation has not been completed successfully! Read description below for details")
                        console.warn(response)
                }
            }
        }
    });


/***/ }),

/***/ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true":
/*!**************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist/templateLoader.js??ref--5!./node_modules/vue-loader/dist??ref--8-0!./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true ***!
  \**************************************************************************************************************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.esm-bundler.js");

const _withId = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["withScopeId"])("data-v-bdc288f6")

Object(vue__WEBPACK_IMPORTED_MODULE_0__["pushScopeId"])("data-v-bdc288f6")
const _hoisted_1 = { class: "register center horizontal-vertical" }
const _hoisted_2 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("h1", null, "Register", -1 /* HOISTED */)
const _hoisted_3 = { key: 0 }
const _hoisted_4 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createTextVNode"])("Sign up")
const _hoisted_5 = {
  key: 1,
  class: "registered"
}
const _hoisted_6 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createTextVNode"])(" Thank you for sign up to Diving game! Now you can login and jump into a game. ")
const _hoisted_7 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createTextVNode"])("Return to login")
Object(vue__WEBPACK_IMPORTED_MODULE_0__["popScopeId"])()

const render = /*#__PURE__*/_withId((_ctx, _cache, $props, $setup, $data, $options) => {
  const _component_input_vue = Object(vue__WEBPACK_IMPORTED_MODULE_0__["resolveComponent"])("input-vue")
  const _component_button_vue = Object(vue__WEBPACK_IMPORTED_MODULE_0__["resolveComponent"])("button-vue")

  return (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("div", _hoisted_1, [
    _hoisted_2,
    (!$data.success)
      ? (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("form", {
          key: 0,
          onSubmit: _cache[1] || (_cache[1] = (...args) => ($options.validateData && $options.validateData(...args))),
          action: "javascript:void(0);"
        }, [
          Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])(_component_input_vue, {
            onValueChange: $options.setUsername,
            title: "Type an username",
            placeholder: "Username",
            maxim: "24"
          }, null, 8 /* PROPS */, ["onValueChange"]),
          Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])(_component_input_vue, {
            onValueChange: $options.setPassword,
            type: "password",
            title: "Type a password",
            placeholder: "Password",
            minim: "8",
            maxim: "32"
          }, null, 8 /* PROPS */, ["onValueChange"]),
          Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])(_component_input_vue, {
            onValueChange: $options.setEmail,
            type: "email",
            title: "Type your email",
            placeholder: "Email",
            maxim: "256"
          }, null, 8 /* PROPS */, ["onValueChange"]),
          (!$data.success)
            ? (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("p", _hoisted_3, Object(vue__WEBPACK_IMPORTED_MODULE_0__["toDisplayString"])($data.error), 1 /* TEXT */))
            : Object(vue__WEBPACK_IMPORTED_MODULE_0__["createCommentVNode"])("v-if", true),
          Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])(_component_button_vue, null, {
            default: _withId(() => [
              _hoisted_4
            ]),
            _: 1 /* STABLE */
          })
        ], 32 /* HYDRATE_EVENTS */))
      : Object(vue__WEBPACK_IMPORTED_MODULE_0__["createCommentVNode"])("v-if", true),
    ($data.success)
      ? (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("div", _hoisted_5, [
          _hoisted_6,
          Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])(_component_button_vue, { destination: "./" }, {
            default: _withId(() => [
              _hoisted_7
            ]),
            _: 1 /* STABLE */
          })
        ]))
      : Object(vue__WEBPACK_IMPORTED_MODULE_0__["createCommentVNode"])("v-if", true)
  ]))
})

/***/ }),

/***/ "./src/register.js":
/*!*************************!*\
  !*** ./src/register.js ***!
  \*************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _scss_main_scss__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./scss/main.scss */ "./src/scss/main.scss");
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.esm-bundler.js");
/* harmony import */ var vuex__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! vuex */ "./node_modules/vuex/dist/vuex.esm-browser.js");
/* harmony import */ var _vue_Register_vue__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./vue/Register.vue */ "./src/vue/Register.vue");






const App = {
    components: {
        Register: _vue_Register_vue__WEBPACK_IMPORTED_MODULE_3__["default"]
    }
}
  
vue__WEBPACK_IMPORTED_MODULE_1__["createApp"](App).mount('#app')

/***/ }),

/***/ "./src/vue/Register.vue":
/*!******************************!*\
  !*** ./src/vue/Register.vue ***!
  \******************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _Register_vue_vue_type_template_id_bdc288f6_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Register.vue?vue&type=template&id=bdc288f6&scoped=true */ "./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true");
/* harmony import */ var _Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Register.vue?vue&type=script&lang=js */ "./src/vue/Register.vue?vue&type=script&lang=js");
/* empty/unused harmony star reexport *//* harmony import */ var _Register_vue_vue_type_style_index_0_id_bdc288f6_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true */ "./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true");





_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].render = _Register_vue_vue_type_template_id_bdc288f6_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]
_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__scopeId = "data-v-bdc288f6"
/* hot reload */
if (false) {}

_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__file = "src/vue/Register.vue"

/* harmony default export */ __webpack_exports__["default"] = (_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"]);

/***/ }),

/***/ "./src/vue/Register.vue?vue&type=script&lang=js":
/*!******************************************************!*\
  !*** ./src/vue/Register.vue?vue&type=script&lang=js ***!
  \******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_index_js_ref_8_0_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../node_modules/vue-loader/dist??ref--8-0!./Register.vue?vue&type=script&lang=js */ "./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=script&lang=js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _node_modules_vue_loader_dist_index_js_ref_8_0_Register_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]; });

/* empty/unused harmony star reexport */ 

/***/ }),

/***/ "./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true":
/*!***************************************************************************************!*\
  !*** ./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true ***!
  \***************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_mini_css_extract_plugin_dist_loader_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_dist_stylePostLoader_js_node_modules_postcss_loader_dist_cjs_js_ref_2_2_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_dist_index_js_ref_8_0_Register_vue_vue_type_style_index_0_id_bdc288f6_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../node_modules/mini-css-extract-plugin/dist/loader.js!../../node_modules/css-loader/dist/cjs.js!../../node_modules/vue-loader/dist/stylePostLoader.js!../../node_modules/postcss-loader/dist/cjs.js??ref--2-2!../../node_modules/sass-loader/dist/cjs.js!../../node_modules/vue-loader/dist??ref--8-0!./Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true */ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=style&index=0&id=bdc288f6&lang=scss&scoped=true");
/* empty/unused harmony star reexport */

/***/ }),

/***/ "./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true":
/*!************************************************************************!*\
  !*** ./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true ***!
  \************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Register_vue_vue_type_template_id_bdc288f6_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../node_modules/vue-loader/dist/templateLoader.js??ref--5!../../node_modules/vue-loader/dist??ref--8-0!./Register.vue?vue&type=template&id=bdc288f6&scoped=true */ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/Register.vue?vue&type=template&id=bdc288f6&scoped=true");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Register_vue_vue_type_template_id_bdc288f6_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]; });



/***/ })

/******/ });
//# sourceMappingURL=register.bundle.js.map
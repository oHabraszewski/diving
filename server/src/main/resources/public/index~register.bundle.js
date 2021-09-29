(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["index~register"],{

/***/ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true":
/*!**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js??ref--2-2!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true ***!
  \**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true":
/*!*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js??ref--2-2!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true ***!
  \*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=script&lang=js":
/*!********************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Button.vue?vue&type=script&lang=js ***!
  \********************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);

    /* harmony default export */ __webpack_exports__["default"] = ({
        props: ['destination'],
        methods: {
            changeDir(){
                setTimeout(()=>{
                    if(this.destination != undefined){
                        location.href = this.destination
                    }
                },300)
            }
        }
    });


/***/ }),

/***/ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=script&lang=js":
/*!*******************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Input.vue?vue&type=script&lang=js ***!
  \*******************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);

    /* harmony default export */ __webpack_exports__["default"] = ({
        props: ["placeholder", "title", "value", "type", "minim", "maxim"],
        watch: {
            value(o, n){
                this.$emit("valueChange", this.value)
            }
        }
    });


/***/ }),

/***/ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true":
/*!***********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist/templateLoader.js??ref--5!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true ***!
  \***********************************************************************************************************************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.esm-bundler.js");

const _withId = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["withScopeId"])("data-v-32983dce")

Object(vue__WEBPACK_IMPORTED_MODULE_0__["pushScopeId"])("data-v-32983dce")
const _hoisted_1 = { class: "button-container" }
Object(vue__WEBPACK_IMPORTED_MODULE_0__["popScopeId"])()

const render = /*#__PURE__*/_withId((_ctx, _cache, $props, $setup, $data, $options) => {
  return (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("div", _hoisted_1, [
    Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("button", {
      onClick: _cache[1] || (_cache[1] = (...args) => ($options.changeDir && $options.changeDir(...args))),
      class: "button"
    }, [
      Object(vue__WEBPACK_IMPORTED_MODULE_0__["renderSlot"])(_ctx.$slots, "default")
    ])
  ]))
})

/***/ }),

/***/ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true":
/*!**********************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist/templateLoader.js??ref--5!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true ***!
  \**********************************************************************************************************************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.esm-bundler.js");

const _withId = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["withScopeId"])("data-v-74b05f33")

Object(vue__WEBPACK_IMPORTED_MODULE_0__["pushScopeId"])("data-v-74b05f33")
const _hoisted_1 = { class: "input-container" }
const _hoisted_2 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("br", null, null, -1 /* HOISTED */)
Object(vue__WEBPACK_IMPORTED_MODULE_0__["popScopeId"])()

const render = /*#__PURE__*/_withId((_ctx, _cache, $props, $setup, $data, $options) => {
  return (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("div", _hoisted_1, [
    Object(vue__WEBPACK_IMPORTED_MODULE_0__["withDirectives"])(Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("input", {
      type: $props.type,
      title: $props.title,
      class: "input",
      placeholder: $props.placeholder,
      minlength: $props.minim,
      maxlength: $props.maxim,
      "onUpdate:modelValue": _cache[1] || (_cache[1] = $event => ($props.value = $event)),
      required: ""
    }, null, 8 /* PROPS */, ["type", "title", "placeholder", "minlength", "maxlength"]), [
      [vue__WEBPACK_IMPORTED_MODULE_0__["vModelDynamic"], $props.value]
    ]),
    _hoisted_2
  ]))
})

/***/ }),

/***/ "./src/js/utils/ConfigVars.js":
/*!************************************!*\
  !*** ./src/js/utils/ConfigVars.js ***!
  \************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
const ConfigVars = {
    HOSTNAME: "http://localhost:8080/",
    API_PREFIX: "/api"
}
/* harmony default export */ __webpack_exports__["default"] = (ConfigVars);

/***/ }),

/***/ "./src/js/utils/connectAxios.js":
/*!**************************************!*\
  !*** ./src/js/utils/connectAxios.js ***!
  \**************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var axios__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! axios */ "./node_modules/axios/index.js");
/* harmony import */ var axios__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(axios__WEBPACK_IMPORTED_MODULE_0__);


async function connect(address, data){
    return new Promise((resolve)=>{
        axios__WEBPACK_IMPORTED_MODULE_0___default.a.post(address, data).then(response=>{
                    resolve(response)
                }).catch(errored=>{
                    let response
                    response.success = false
                    response.error = errored
                    resolve(response)
                    console.error("An error occured while trying connecting with a server, see description for more details: " + errored)
                })
    })
}

/* harmony default export */ __webpack_exports__["default"] = (connect);

/***/ }),

/***/ "./src/vue/components/Button.vue":
/*!***************************************!*\
  !*** ./src/vue/components/Button.vue ***!
  \***************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _Button_vue_vue_type_template_id_32983dce_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Button.vue?vue&type=template&id=32983dce&scoped=true */ "./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true");
/* harmony import */ var _Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Button.vue?vue&type=script&lang=js */ "./src/vue/components/Button.vue?vue&type=script&lang=js");
/* empty/unused harmony star reexport *//* harmony import */ var _Button_vue_vue_type_style_index_0_id_32983dce_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true */ "./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true");





_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].render = _Button_vue_vue_type_template_id_32983dce_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]
_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__scopeId = "data-v-32983dce"
/* hot reload */
if (false) {}

_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__file = "src/vue/components/Button.vue"

/* harmony default export */ __webpack_exports__["default"] = (_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"]);

/***/ }),

/***/ "./src/vue/components/Button.vue?vue&type=script&lang=js":
/*!***************************************************************!*\
  !*** ./src/vue/components/Button.vue?vue&type=script&lang=js ***!
  \***************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_index_js_ref_8_0_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist??ref--8-0!./Button.vue?vue&type=script&lang=js */ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=script&lang=js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _node_modules_vue_loader_dist_index_js_ref_8_0_Button_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]; });

/* empty/unused harmony star reexport */ 

/***/ }),

/***/ "./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true":
/*!************************************************************************************************!*\
  !*** ./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true ***!
  \************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_mini_css_extract_plugin_dist_loader_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_dist_stylePostLoader_js_node_modules_postcss_loader_dist_cjs_js_ref_2_2_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_dist_index_js_ref_8_0_Button_vue_vue_type_style_index_0_id_32983dce_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/mini-css-extract-plugin/dist/loader.js!../../../node_modules/css-loader/dist/cjs.js!../../../node_modules/vue-loader/dist/stylePostLoader.js!../../../node_modules/postcss-loader/dist/cjs.js??ref--2-2!../../../node_modules/sass-loader/dist/cjs.js!../../../node_modules/vue-loader/dist??ref--8-0!./Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true */ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=style&index=0&id=32983dce&lang=scss&scoped=true");
/* empty/unused harmony star reexport */

/***/ }),

/***/ "./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true":
/*!*********************************************************************************!*\
  !*** ./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true ***!
  \*********************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Button_vue_vue_type_template_id_32983dce_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist/templateLoader.js??ref--5!../../../node_modules/vue-loader/dist??ref--8-0!./Button.vue?vue&type=template&id=32983dce&scoped=true */ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Button.vue?vue&type=template&id=32983dce&scoped=true");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Button_vue_vue_type_template_id_32983dce_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]; });



/***/ }),

/***/ "./src/vue/components/Input.vue":
/*!**************************************!*\
  !*** ./src/vue/components/Input.vue ***!
  \**************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _Input_vue_vue_type_template_id_74b05f33_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Input.vue?vue&type=template&id=74b05f33&scoped=true */ "./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true");
/* harmony import */ var _Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Input.vue?vue&type=script&lang=js */ "./src/vue/components/Input.vue?vue&type=script&lang=js");
/* empty/unused harmony star reexport *//* harmony import */ var _Input_vue_vue_type_style_index_0_id_74b05f33_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true */ "./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true");





_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].render = _Input_vue_vue_type_template_id_74b05f33_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]
_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__scopeId = "data-v-74b05f33"
/* hot reload */
if (false) {}

_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__file = "src/vue/components/Input.vue"

/* harmony default export */ __webpack_exports__["default"] = (_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"]);

/***/ }),

/***/ "./src/vue/components/Input.vue?vue&type=script&lang=js":
/*!**************************************************************!*\
  !*** ./src/vue/components/Input.vue?vue&type=script&lang=js ***!
  \**************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_index_js_ref_8_0_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist??ref--8-0!./Input.vue?vue&type=script&lang=js */ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=script&lang=js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _node_modules_vue_loader_dist_index_js_ref_8_0_Input_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]; });

/* empty/unused harmony star reexport */ 

/***/ }),

/***/ "./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true":
/*!***********************************************************************************************!*\
  !*** ./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true ***!
  \***********************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_mini_css_extract_plugin_dist_loader_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_dist_stylePostLoader_js_node_modules_postcss_loader_dist_cjs_js_ref_2_2_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_dist_index_js_ref_8_0_Input_vue_vue_type_style_index_0_id_74b05f33_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/mini-css-extract-plugin/dist/loader.js!../../../node_modules/css-loader/dist/cjs.js!../../../node_modules/vue-loader/dist/stylePostLoader.js!../../../node_modules/postcss-loader/dist/cjs.js??ref--2-2!../../../node_modules/sass-loader/dist/cjs.js!../../../node_modules/vue-loader/dist??ref--8-0!./Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true */ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=style&index=0&id=74b05f33&lang=scss&scoped=true");
/* empty/unused harmony star reexport */

/***/ }),

/***/ "./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true":
/*!********************************************************************************!*\
  !*** ./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true ***!
  \********************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Input_vue_vue_type_template_id_74b05f33_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist/templateLoader.js??ref--5!../../../node_modules/vue-loader/dist??ref--8-0!./Input.vue?vue&type=template&id=74b05f33&scoped=true */ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Input.vue?vue&type=template&id=74b05f33&scoped=true");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Input_vue_vue_type_template_id_74b05f33_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]; });



/***/ })

}]);
//# sourceMappingURL=index~register.bundle.js.map
(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["credits~technical"],{

/***/ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true":
/*!***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js??ref--2-2!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true ***!
  \***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=script&lang=js":
/*!*********************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Article.vue?vue&type=script&lang=js ***!
  \*********************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);

    /* harmony default export */ __webpack_exports__["default"] = ({
        data(){
            return {
                id: ""
            }
        },
        props: ["name"],
        mounted(){
            const nameArray = this.name.toLowerCase().split("")
            nameArray.forEach((element, index) => {
                if(element == " "){
                    nameArray[index] = "-"
                }
            });
            this.id = nameArray.join("");
        }
    });


/***/ }),

/***/ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true":
/*!************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/dist/templateLoader.js??ref--5!./node_modules/vue-loader/dist??ref--8-0!./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true ***!
  \************************************************************************************************************************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.esm-bundler.js");

const _withId = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["withScopeId"])("data-v-e7e7a3c2")

Object(vue__WEBPACK_IMPORTED_MODULE_0__["pushScopeId"])("data-v-e7e7a3c2")
const _hoisted_1 = { class: "section-container" }
const _hoisted_2 = /*#__PURE__*/Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("br", null, null, -1 /* HOISTED */)
Object(vue__WEBPACK_IMPORTED_MODULE_0__["popScopeId"])()

const render = /*#__PURE__*/_withId((_ctx, _cache, $props, $setup, $data, $options) => {
  return (Object(vue__WEBPACK_IMPORTED_MODULE_0__["openBlock"])(), Object(vue__WEBPACK_IMPORTED_MODULE_0__["createBlock"])("div", _hoisted_1, [
    Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("article", { id: $data.id }, [
      Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("h2", null, Object(vue__WEBPACK_IMPORTED_MODULE_0__["toDisplayString"])($props.name), 1 /* TEXT */),
      Object(vue__WEBPACK_IMPORTED_MODULE_0__["createVNode"])("p", null, [
        Object(vue__WEBPACK_IMPORTED_MODULE_0__["renderSlot"])(_ctx.$slots, "default")
      ])
    ], 8 /* PROPS */, ["id"]),
    _hoisted_2
  ]))
})

/***/ }),

/***/ "./src/vue/components/Article.vue":
/*!****************************************!*\
  !*** ./src/vue/components/Article.vue ***!
  \****************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _Article_vue_vue_type_template_id_e7e7a3c2_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Article.vue?vue&type=template&id=e7e7a3c2&scoped=true */ "./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true");
/* harmony import */ var _Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Article.vue?vue&type=script&lang=js */ "./src/vue/components/Article.vue?vue&type=script&lang=js");
/* empty/unused harmony star reexport *//* harmony import */ var _Article_vue_vue_type_style_index_0_id_e7e7a3c2_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true */ "./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true");





_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].render = _Article_vue_vue_type_template_id_e7e7a3c2_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]
_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__scopeId = "data-v-e7e7a3c2"
/* hot reload */
if (false) {}

_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"].__file = "src/vue/components/Article.vue"

/* harmony default export */ __webpack_exports__["default"] = (_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"]);

/***/ }),

/***/ "./src/vue/components/Article.vue?vue&type=script&lang=js":
/*!****************************************************************!*\
  !*** ./src/vue/components/Article.vue?vue&type=script&lang=js ***!
  \****************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_index_js_ref_8_0_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist??ref--8-0!./Article.vue?vue&type=script&lang=js */ "./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=script&lang=js");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "default", function() { return _node_modules_vue_loader_dist_index_js_ref_8_0_Article_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]; });

/* empty/unused harmony star reexport */ 

/***/ }),

/***/ "./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true":
/*!*************************************************************************************************!*\
  !*** ./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true ***!
  \*************************************************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_mini_css_extract_plugin_dist_loader_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_dist_stylePostLoader_js_node_modules_postcss_loader_dist_cjs_js_ref_2_2_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_dist_index_js_ref_8_0_Article_vue_vue_type_style_index_0_id_e7e7a3c2_lang_scss_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/mini-css-extract-plugin/dist/loader.js!../../../node_modules/css-loader/dist/cjs.js!../../../node_modules/vue-loader/dist/stylePostLoader.js!../../../node_modules/postcss-loader/dist/cjs.js??ref--2-2!../../../node_modules/sass-loader/dist/cjs.js!../../../node_modules/vue-loader/dist??ref--8-0!./Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true */ "./node_modules/mini-css-extract-plugin/dist/loader.js!./node_modules/css-loader/dist/cjs.js!./node_modules/vue-loader/dist/stylePostLoader.js!./node_modules/postcss-loader/dist/cjs.js?!./node_modules/sass-loader/dist/cjs.js!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=style&index=0&id=e7e7a3c2&lang=scss&scoped=true");
/* empty/unused harmony star reexport */

/***/ }),

/***/ "./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true":
/*!**********************************************************************************!*\
  !*** ./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true ***!
  \**********************************************************************************/
/*! exports provided: render */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Article_vue_vue_type_template_id_e7e7a3c2_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../node_modules/vue-loader/dist/templateLoader.js??ref--5!../../../node_modules/vue-loader/dist??ref--8-0!./Article.vue?vue&type=template&id=e7e7a3c2&scoped=true */ "./node_modules/vue-loader/dist/templateLoader.js?!./node_modules/vue-loader/dist/index.js?!./src/vue/components/Article.vue?vue&type=template&id=e7e7a3c2&scoped=true");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_dist_templateLoader_js_ref_5_node_modules_vue_loader_dist_index_js_ref_8_0_Article_vue_vue_type_template_id_e7e7a3c2_scoped_true__WEBPACK_IMPORTED_MODULE_0__["render"]; });



/***/ })

}]);
//# sourceMappingURL=credits~technical.bundle.js.map
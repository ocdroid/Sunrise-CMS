! function(e) {
    var t = {};

    function i(n) {
        if (t[n]) return t[n].exports;
        var o = t[n] = {
            i: n,
            l: !1,
            exports: {}
        };
        return e[n].call(o.exports, o, o.exports, i), o.l = !0, o.exports
    }
    i.m = e, i.c = t, i.d = function(e, t, n) {
        i.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: n
        })
    }, i.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, i.t = function(e, t) {
        if (1 & t && (e = i(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var n = Object.create(null);
        if (i.r(n), Object.defineProperty(n, "default", {
                enumerable: !0,
                value: e
            }), 2 & t && "string" != typeof e)
            for (var o in e) i.d(n, o, function(t) {
                return e[t]
            }.bind(null, o));
        return n
    }, i.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return i.d(t, "a", t), t
    }, i.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, i.p = "", i(i.s = "XJR1")
}({
    "0A7J": function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d"),
            _modules_colorPicker__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__("EjF6");
        __webpack_exports__.a = {
            name: "fontColor",
            add: function(core, targetElement) {
                core.addModule([_modules_colorPicker__WEBPACK_IMPORTED_MODULE_1__.a]);
                const context = core.context;
                context.fontColor = {
                    previewEl: null,
                    colorInput: null
                };
                let listDiv = eval(this.setSubmenu(context.colorPicker.colorListHTML));
                context.fontColor.colorInput = listDiv.getElementsByClassName("sun-editor-id-submenu-color-input")[0], context.fontColor.colorInput.addEventListener("keyup", this.onChangeInput.bind(core)), listDiv.getElementsByClassName("sun-editor-id-submenu-color-submit")[0].addEventListener("click", this.submit.bind(core)), listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-submenu layer_editor", t.style.display = "none", t.innerHTML = e, t
            },
            on: function() {
                const e = this.context.colorPicker;
                e._colorInput = this.context.fontColor.colorInput, e._defaultColor = "#000000", e._styleProperty = "color", this.plugins.colorPicker.init.call(this, this.getSelectionNode(), null)
            },
            onChangeInput: function(e) {
                this.plugins.colorPicker.setCurrentColor.call(this, "#" + e.target.value)
            },
            submit: function() {
                this.plugins.fontColor.applyColor.call(this, this.context.colorPicker._currentColor)
            },
            pickup: function(e) {
                if (e.preventDefault(), e.stopPropagation(), !/^BUTTON$/i.test(e.target.tagName)) return !1;
                this.plugins.fontColor.applyColor.call(this, e.target.getAttribute("data-value"))
            },
            applyColor: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("SPAN");
                t.style.color = e, this.nodeChange(t, ["color"]), this.submenuOff(), this.focus()
            }
        }
    },
    "1kvd": function(e, t, i) {
        "use strict";
        var n = i("8e1d");
        t.a = {
            name: "dialog",
            add: function(e) {
                const t = e.context;
                t.dialog = {};
                let i = n.a.createElement("DIV");
                i.className = "sun-editor-id-dialogBox sun-editor-common";
                let o = n.a.createElement("DIV");
                o.className = "modal-dialog-background sun-editor-id-dialog-back", o.style.display = "none";
                let l = n.a.createElement("DIV");
                l.className = "modal-dialog sun-editor-id-dialog-modal", l.style.display = "none", i.appendChild(o), i.appendChild(l), t.dialog.modalArea = i, t.dialog.back = o, t.dialog.modal = l, t.dialog.modal.addEventListener("click", this.onClick_dialog.bind(e)), t.element.relative.appendChild(i), i = null, o = null, l = null
            },
            onClick_dialog: function(e) {
                e.stopPropagation(), (/modal-dialog/.test(e.target.className) || /close/.test(e.target.getAttribute("data-command"))) && this.plugins.dialog.close.call(this)
            },
            open: function(e, t) {
                if (this.modalForm) return !1;
                this.context.dialog.updateModal = t, "full" === this.context.option.popupDisplay ? this.context.dialog.modalArea.style.position = "fixed" : this.context.dialog.modalArea.style.position = "absolute", this.context.dialog.kind = e, this.modalForm = this.context[e].modal;
                const i = this.context[e].focusElement;
                this.context.dialog.modalArea.style.display = "block", this.context.dialog.back.style.display = "block", this.context.dialog.modal.style.display = "block", this.modalForm.style.display = "block", i && i.focus()
            },
            close: function() {
                this.modalForm.style.display = "none", this.context.dialog.back.style.display = "none", this.context.dialog.modalArea.style.display = "none", this.modalForm = null, this.context.dialog.updateModal = !1, this.plugins[this.context.dialog.kind].init.call(this)
            }
        }
    },
    "3FqI": function(e, t, i) {},
    "50IV": function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "font",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.context.option));
                listDiv.getElementsByClassName("list_family")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                let i, n, o, l;
                t.className = "layer_editor", t.style.display = "none";
                let a = e.font ? e.font : ["Arial", "Comic Sans MS", "Courier New,Courier", "Impact,Charcoal,sans-serif", "Georgia", "tahoma", "Trebuchet MS,Helvetica", "Verdana"],
                    s = '<div class="sun-editor-submenu inner_layer list_family">   <ul class="list_editor sun-editor-list-font-family">';
                for (o = 0, l = a.length; o < l; o++) n = (i = a[o]).split(",")[0], s += '<li><button type="button" class="btn_edit" data-value="' + i + '" data-txt="' + n + '" title="' + n + '" style="font-family:' + i + ';">' + n + "</button></li>";
                return s += "   </ul>", s += "</div>", t.innerHTML = s, t
            },
            pickup: function(e) {
                if (!/^BUTTON$/i.test(e.target.tagName)) return !1;
                e.preventDefault(), e.stopPropagation();
                const t = e.target;
                _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(this.context.tool.font, t.getAttribute("data-txt"));
                const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("SPAN");
                i.style.fontFamily = t.getAttribute("data-value"), this.nodeChange(i, ["font-family"]), this.submenuOff(), this.focus()
            }
        }
    },
    "8e1d": function(e, t, i) {
        "use strict";
        const n = {
            _d: document,
            _w: window,
            zeroWidthSpace: "​",
            getXMLHttpRequest: function() {
                if (!this._w.ActiveXObject) return this._w.XMLHttpRequest ? new XMLHttpRequest : null;
                try {
                    return new ActiveXObject("Msxml2.XMLHTTP")
                } catch (e) {
                    try {
                        return new ActiveXObject("Microsoft.XMLHTTP")
                    } catch (e) {
                        return null
                    }
                }
            },
            copyObj: function(e) {
                const t = {};
                for (let i in e) t[i] = e[i];
                return t
            },
            createElement: function(e) {
                return this._d.createElement(e)
            },
            createTextNode: function(e) {
                return this._d.createTextNode(e || "")
            },
            getIncludePath: function(e, t) {
                let i = "";
                const n = [],
                    o = "js" === t ? "script" : "link",
                    l = "js" === t ? "src" : "href";
                let a = "(?:";
                for (let t = 0, i = e.length; t < i; t++) a += e[t] + (t < i - 1 ? "|" : ")");
                const s = new RegExp("(^|.*[\\\\/])" + a + "(\\.[^\\\\/]+)?." + t + "(?:\\?.*|;.*)?$", "i"),
                    r = new RegExp(".+\\." + t + "(?:\\?.*|;.*)?$", "i");
                for (let e = this._d.getElementsByTagName(o), t = 0; t < e.length; t++) r.test(e[t][l]) && n.push(e[t]);
                for (let e = 0; e < n.length; e++) {
                    let t = n[e][l].match(s);
                    if (t) {
                        i = t[0];
                        break
                    }
                }
                if ("" === i && (i = n.length > 0 ? n[0][l] : ""), -1 === i.indexOf(":/") && "//" !== i.slice(0, 2) && (i = 0 === i.indexOf("/") ? location.href.match(/^.*?:\/\/[^\/]*/)[0] + i : location.href.match(/^[^\?]*\/(?:)/)[0] + i), !i) throw "[SUNEDITOR.util.getIncludePath.fail] The SUNEDITOR installation path could not be automatically detected. (name: +" + name + ", extension: " + t + ")";
                return i
            },
            convertContentsForEditor: function(e) {
                let t, i, n = "";
                e = e.trim();
                for (let o = 0, l = (t = this._d.createRange().createContextualFragment(e).childNodes).length; o < l; o++)
                    if (i = t[o].outerHTML || t[o].textContent, 3 === t[o].nodeType) {
                        const e = i.split(/\n/g);
                        let t = "";
                        for (let i = 0, o = e.length; i < o; i++)(t = e[i].trim()).length > 0 && (n += "<P>" + t + "</p>")
                    } else n += i;
                const o = {
                    "&": "&amp;",
                    " ": "&nbsp;",
                    "'": "&quot;",
                    "<": "&lt;",
                    ">": "&gt;"
                };
                return e = e.replace(/&|\u00A0|'|<|>/g, function(e) {
                    return "string" == typeof o[e] ? o[e] : e
                }), 0 === n.length && (n = "<p>" + (e.length > 0 ? e : this.zeroWidthSpace) + "</p>"), n
            },
            convertHTMLForCodeView: function(e) {
                return e.replace(/\s*<(?:li|td)\s*(?:[a-z\-]+)?\s*(?:="?[^>]*"?)?\s*>/gi, this._insertIndent).replace(/<\/?(?:blockquote|hr|ol|ul|table|tbody|thead|th|tr)\s*(?:[a-z\-]+)?\s*(?:="?[^>]*"?)?\s*>(?=[^\n])/gi, this._insertLineBreak).replace(/<\/(?:p|div|h[1-6]|li|td|pre)>(?=[^\n])/gi, this._insertLineBreak)
            },
            _insertIndent: function(e) {
                return "  " + e.trim()
            },
            _insertLineBreak: function(e) {
                return e + "\n"
            },
            isWysiwygDiv: function(e) {
                return !(!e || 1 !== e.nodeType || !this.hasClass(e, "sun-editor-id-wysiwyg"))
            },
            isFormatElement: function(e) {
                return !(!e || 1 !== e.nodeType || !/^(?:P|DIV|H[1-6]|LI|CODE)$/i.test(e.nodeName) || /sun-editor-id-comp/.test(e.className))
            },
            isRangeFormatElement: function(e) {
                return !(!e || 1 !== e.nodeType || !/^(?:BLOCKQUOTE|TABLE|THEAD|TBODY|TH|TR|TD|OL|UL|PRE|FIGCAPTION)$/i.test(e.nodeName))
            },
            getFormatElement: function(e) {
                if (!e) return null;
                for (; !this.isFormatElement(e) && !this.isWysiwygDiv(e.parentNode);) e = e.parentNode;
                if (this.isWysiwygDiv(e) || this.isRangeFormatElement(e)) {
                    return this.getListChildren(e, function(e) {
                        return this.isFormatElement(e)
                    }.bind(this))[0]
                }
                return e
            },
            getRangeFormatElement: function(e) {
                if (!e) return null;
                for (; !this.isRangeFormatElement(e) && !this.isWysiwygDiv(e);) e = e.parentNode;
                return this.isWysiwygDiv(e) ? null : e
            },
            getArrayIndex: function(e, t) {
                let i = -1;
                for (let n = 0, o = e.length; n < o; n++)
                    if (e[n] === t) {
                        i = n;
                        break
                    } return i
            },
            nextIdx: function(e, t) {
                let i = this.getArrayIndex(e, t);
                return -1 === i ? -1 : i + 1
            },
            prevIdx: function(e, t) {
                let i = this.getArrayIndex(e, t);
                return -1 === i ? -1 : i - 1
            },
            isCell: function(e) {
                return e && /^(?:TD|TH)$/i.test(e.nodeName)
            },
            isBreak: function(e) {
                return e && /^BR$/i.test(e.nodeName)
            },
            getListChildren: function(e, t) {
                const i = [];
                return e && e.children ? (t = t || function() {
                    return !0
                }, function n(o) {
                    e !== o && t(o) && i.push(o);
                    for (let e = 0, t = o.children.length; e < t; e++) n(o.children[e])
                }(e), i) : i
            },
            getListChildNodes: function(e, t) {
                const i = [];
                return e && e.childNodes ? (t = t || function() {
                    return !0
                }, function n(o) {
                    e !== o && t(o) && i.push(o);
                    for (let e = 0, t = o.childNodes.length; e < t; e++) n(o.childNodes[e])
                }(e), i) : i
            },
            getParentElement: function(e, t) {
                let i;
                if ("function" == typeof t) i = t;
                else {
                    let e;
                    /\./.test(t) ? (e = "className", t = t.split(".")[1]) : /#/.test(t) ? (e = "id", t = "^" + t.split("#")[1] + "$") : /:/.test(t) ? (e = "name", t = "^" + t.split(":")[1] + "$") : (e = "tagName", t = "^" + t + "$");
                    const n = new RegExp(t, "i");
                    i = function(t) {
                        return n.test(t[e])
                    }
                }
                for (; e && (3 === e.nodeType || !i(e));) {
                    if (this.isWysiwygDiv(e)) return null;
                    e = e.parentNode
                }
                return e
            },
            getChildElement: function(e, t) {
                let i;
                if ("function" == typeof t) i = t;
                else {
                    let e;
                    /\./.test(t) ? (e = "className", t = t.split(".")[1]) : /#/.test(t) ? (e = "id", t = "^" + t.split("#")[1] + "$") : /:/.test(t) ? (e = "name", t = "^" + t.split(":")[1] + "$") : (e = "tagName", t = "^" + t + "$");
                    const n = new RegExp(t, "i");
                    i = function(t) {
                        return n.test(t[e])
                    }
                }
                return this.getListChildren(e, function(e) {
                    return i(e)
                })[0]
            },
            getOffset: function(e) {
                let t = 0,
                    i = 0,
                    n = 3 === e.nodeType ? e.parentElement : e;
                for (; !this.isWysiwygDiv(n.parentNode);)(/^(A|TD|TH|FIGURE|FIGCAPTION|IMG|IFRAME)$/i.test(n.nodeName) || /relative/i.test(n.style.position)) && (t += n.offsetLeft, i += n.offsetTop), n = n.parentNode;
                return {
                    left: t,
                    top: i - n.parentNode.scrollTop
                }
            },
            changeTxt: function(e, t) {
                e && t && (e.textContent = t)
            },
            hasClass: function(e, t) {
                if (e) return e.classList.contains(t.trim())
            },
            addClass: function(e, t) {
                if (!e) return;
                new RegExp("(\\s|^)" + t + "(\\s|$)").test(e.className) || (e.className += " " + t)
            },
            removeClass: function(e, t) {
                if (!e) return;
                const i = new RegExp("(\\s|^)" + t + "(\\s|$)");
                e.className = e.className.replace(i, " ").trim()
            },
            toggleClass: function(e, t) {
                if (!e) return;
                const i = new RegExp("(\\s|^)" + t + "(\\s|$)");
                i.test(e.className) ? e.className = e.className.replace(i, " ").trim() : e.className += " " + t
            },
            removeItem: function(e) {
                try {
                    e.remove()
                } catch (t) {
                    e.parentNode.removeChild(e)
                }
            },
            removeEmptyNode: function(e) {
                ! function e(t) {
                    if (0 !== t.textContent.trim().length || /^BR$/i.test(t.nodeName) || t.firstChild && /^BR$/i.test(t.firstChild.nodeName))
                        for (let i = 0, n = t.children.length; i < n; i++) t.children[i] && e(t.children[i]);
                    else t.parentNode && t.parentNode.removeChild(t)
                }(e)
            },
            cleanHTML: function(e) {
                const t = new RegExp("^(P|DIV|PRE|H1|H2|H3|H4|H5|H6|B|U|I|STRIKE|SUB|SUP|OL|UL|TABLE|BR|HR|A|IMG|IFRAME)$", "i"),
                    i = this._d.createRange().createContextualFragment(e).children;
                let n = "";
                for (let e = 0, o = i.length; e < o; e++) t.test(i[e].nodeName) ? n += i[e].outerHTML.replace(/\s(?:style|class|dir|xmlns|data-[a-z\-]+)\s*(?:[a-z\-]+)?\s*(?:="?[^>]*"?)?\s*/gi, "").replace(/<\/?(?:span|font)\s*(?:[a-z\-]+)?\s*(?:="?[^>]*"?)?\s*>/gi, "").replace(/<\/?[a-z]+:[a-z]+\s*(?:[a-z\-]+)?\s*(?:="?[^>]*"?)?\s*>/gi, "") : n += i[e].textContent;
                return n || e
            }
        };
        t.a = n
    },
    EjF6: function(e, t, i) {
        "use strict";
        var n = i("8e1d");
        t.a = {
            name: "colorPicker",
            add: function(e) {
                const t = e.context;
                t.colorPicker = {
                    colorListHTML: "",
                    _colorInput: "",
                    _defaultColor: "#000",
                    _styleProperty: "color",
                    _currentColor: ""
                };
                let i = this.createColorList(e.context.option, e.lang);
                t.colorPicker.colorListHTML = i, i = null
            },
            createColorList: function(e, t) {
                const i = e.colorList ? e.colorList : ["#ff0000", "#ff5e00", "#ffe400", "#abf200", "#00d8ff", "#0055ff", "#6600ff", "#ff00dd", "#000000", "#ffd8d8", "#fae0d4", "#faf4c0", "#e4f7ba", "#d4f4fa", "#d9e5ff", "#e8d9ff", "#ffd9fa", "#ffffff", "#ffa7a7", "#ffc19e", "#faed7d", "#cef279", "#b2ebf4", "#b2ccff", "#d1b2ff", "#ffb2f5", "#bdbdbd", "#f15f5f", "#f29661", "#e5d85c", "#bce55c", "#5cd1e5", "#6699ff", "#a366ff", "#f261df", "#8c8c8c", "#980000", "#993800", "#998a00", "#6b9900", "#008299", "#003399", "#3d0099", "#990085", "#353535", "#670000", "#662500", "#665c00", "#476600", "#005766", "#002266", "#290066", "#660058", "#222222"];
                let n = '<div class="inner_layer"><div class="pallet_color_selector">   <ul class="list_color">';
                for (let e = 0, t = i.length; e < t; e++) {
                    const t = i[e];
                    n += '<li>   <button type="button" data-value="' + t + '" title="' + t + '" style="background-color:' + t + ';"></button></li>'
                }
                return n += '</ul></div><form class="sub-form-group">   <label>#</label>   <input type="text" maxlength="6" class="sun-editor-id-submenu-color-input" />   <button type="submit" data-command="100" class="sun-editor-id-submenu-color-submit" title="' + t.dialogBox.submitButton + '"><span>' + t.dialogBox.submitButton + "</span></button></form></div>"
            },
            init: function(e, t) {
                const i = this.plugins.colorPicker;
                let n = t || (i.getColorInNode.call(this, e) || this.context.colorPicker._defaultColor);
                n = i.isHexColor(n) ? n : i.rgb2hex(n), i.setInputText.call(this, n)
            },
            setCurrentColor: function(e) {
                this.context.colorPicker._currentColor = e, this.context.colorPicker._colorInput.style.borderColor = e
            },
            setInputText: function(e) {
                this.context.colorPicker._colorInput.value = e.replace("#", ""), this.plugins.colorPicker.setCurrentColor.call(this, e)
            },
            getColorInNode: function(e) {
                let t = "";
                const i = this.context.colorPicker._styleProperty;
                for (; !n.a.isWysiwygDiv(e) && 0 === t.length;) 1 === e.nodeType && e.style[i] && (t = e.style[i]), e = e.parentNode;
                return t
            },
            isHexColor: function(e) {
                return /^#[0-9a-f]{3}(?:[0-9a-f]{3})?$/i.test(e)
            },
            rgb2hex: function(e) {
                return (e = e.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i)) && 4 === e.length ? "#" + ("0" + parseInt(e[1], 10).toString(16)).slice(-2) + ("0" + parseInt(e[2], 10).toString(16)).slice(-2) + ("0" + parseInt(e[3], 10).toString(16)).slice(-2) : ""
            }
        }
    },
    KKur: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d"),
            _modules_dialog__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__("1kvd"),
            _modules_resizing__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__("ee5k"),
            _modules_notice__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__("PAX9");
        __webpack_exports__.a = {
            name: "image",
            add: function(core) {
                core.addModule([_modules_dialog__WEBPACK_IMPORTED_MODULE_1__.a, _modules_resizing__WEBPACK_IMPORTED_MODULE_2__.a, _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a]);
                const context = core.context;
                context.image = {
                    _linkElement: null,
                    _container: null,
                    _cover: null,
                    _element: null,
                    _element_w: 1,
                    _element_h: 1,
                    _element_l: 0,
                    _element_t: 0,
                    _origin_w: "auto" === context.option.imageWidth ? "" : context.option.imageWidth,
                    _origin_h: "",
                    _altText: "",
                    _caption: null,
                    captionCheckEl: null,
                    _linkValue: "",
                    _align: "none",
                    _captionChecked: !1,
                    _proportionChecked: !0,
                    _floatClassRegExp: "float\\-[a-z]+",
                    _xmlHttp: null,
                    _resizing: context.option.imageResizing,
                    _defaultAuto: "auto" === context.option.imageWidth
                };
                let image_dialog = eval(this.setDialog(core.context.option, core.lang));
                context.image.modal = image_dialog, context.image.imgUrlFile = image_dialog.getElementsByClassName("sun-editor-id-image-url")[0], context.image.imgInputFile = context.image.focusElement = image_dialog.getElementsByClassName("sun-editor-id-image-file")[0], context.image.altText = image_dialog.getElementsByClassName("sun-editor-id-image-alt")[0], context.image.imgLink = image_dialog.getElementsByClassName("sun-editor-id-image-link")[0], context.image.imgLinkNewWindowCheck = image_dialog.getElementsByClassName("sun-editor-id-linkCheck")[0], context.image.captionCheckEl = image_dialog.getElementsByClassName("suneditor-id-image-check-caption")[0], context.image.modal.getElementsByClassName("sun-editor-tab-button")[0].addEventListener("click", this.openTab.bind(core)), context.image.modal.getElementsByClassName("btn-primary")[0].addEventListener("click", this.submit.bind(core)), context.image.imageX = {}, context.image.imageY = {}, context.option.imageResizing && (context.image.proportion = image_dialog.getElementsByClassName("suneditor-id-image-check-proportion")[0], context.image.imageX = image_dialog.getElementsByClassName("sun-editor-id-image-x")[0], context.image.imageY = image_dialog.getElementsByClassName("sun-editor-id-image-y")[0], context.image.imageX.value = context.option.imageWidth, context.image.imageX.addEventListener("change", this.setInputSize.bind(core, "x")), context.image.imageY.addEventListener("change", this.setInputSize.bind(core, "y")), image_dialog.getElementsByClassName("sun-editor-id-image-revert-button")[0].addEventListener("click", this.sizeRevert.bind(core))), context.dialog.modal.appendChild(image_dialog), image_dialog = null
            },
            setDialog: function(e, t) {
                const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                i.className = "modal-content sun-editor-id-dialog-image", i.style.display = "none";
                let n = '<div class="modal-header">   <button type="button" data-command="close" class="close" aria-label="Close" title="' + t.dialogBox.close + '">       <div aria-hidden="true" data-command="close" class="icon-cancel"></div>   </button>   <h5 class="modal-title">' + t.dialogBox.imageBox.title + '</h5></div><div class="sun-editor-tab-button">   <button type="button" class="sun-editor-id-tab-link active" data-tab-link="image">' + t.toolbar.image + '</button>   <button type="button" class="sun-editor-id-tab-link" data-tab-link="url">' + t.toolbar.link + '</button></div><form class="editor_image" method="post" enctype="multipart/form-data">   <div class="sun-editor-id-tab-content sun-editor-id-tab-content-image">       <div class="modal-body">';
                return e.imageFileInput && (n += '   <div class="form-group">       <label>' + t.dialogBox.imageBox.file + '</label>       <input class="form-control sun-editor-id-image-file" type="file" accept="image/*" multiple="multiple" />   </div>'), e.imageUrlInput && (n += '   <div class="form-group">       <label>' + t.dialogBox.imageBox.url + '</label>       <input class="form-control sun-editor-id-image-url" type="text" />   </div>'), n += '           <div class="form-group">               <label>' + t.dialogBox.imageBox.altText + '</label><input class="form-control sun-editor-id-image-alt" type="text" />           </div>', e.imageResizing && (n += '       <div class="form-group">           <div class="size-text"><label class="size-w">' + t.dialogBox.width + '</label><label class="size-x">&nbsp;</label><label class="size-h">' + t.dialogBox.height + '</label></div>           <input class="form-size-control sun-editor-id-image-x" type="number" min="1" ' + ("auto" === e.imageWidth ? "disabled" : "") + ' /><label class="size-x">x</label><input class="form-size-control sun-editor-id-image-y" type="number" min="1" disabled />           <label><input type="checkbox" class="suneditor-id-image-check-proportion" style="margin-left: 20px;" checked disabled/>&nbsp;' + t.dialogBox.proportion + '</label>           <button type="button" title="' + t.dialogBox.revertButton + '" class="btn_editor sun-editor-id-image-revert-button" style="float: right;"><div class="icon-revert"></div></button>       </div>'), n += '           <div class="form-group-footer">               <label><input type="checkbox" class="suneditor-id-image-check-caption" />&nbsp;' + t.dialogBox.caption + '</label>           </div>       </div>   </div>   <div class="sun-editor-id-tab-content sun-editor-id-tab-content-url" style="display: none">       <div class="modal-body">           <div class="form-group">               <label>' + t.dialogBox.linkBox.url + '</label><input class="form-control sun-editor-id-image-link" type="text" />           </div>           <label><input type="checkbox" class="sun-editor-id-linkCheck"/>&nbsp;' + t.dialogBox.linkBox.newWindowCheck + '</label>       </div>   </div>   <div class="modal-footer">       <div style="float: left;">           <label><input type="radio" name="suneditor_image_radio" class="modal-radio" value="none" checked>' + t.dialogBox.basic + '</label>           <label><input type="radio" name="suneditor_image_radio" class="modal-radio" value="left">' + t.dialogBox.left + '</label>           <label><input type="radio" name="suneditor_image_radio" class="modal-radio" value="center">' + t.dialogBox.center + '</label>           <label><input type="radio" name="suneditor_image_radio" class="modal-radio" value="right">' + t.dialogBox.right + '</label>       </div>       <button type="submit" class="btn btn-primary sun-editor-id-submit-image" title="' + t.dialogBox.submitButton + '"><span>' + t.dialogBox.submitButton + "</span></button>   </div></form>", i.innerHTML = n, i
            },
            openTab: function(e) {
                const t = this.context.image.modal,
                    i = "init" === e ? t.getElementsByClassName("sun-editor-id-tab-link")[0] : e.target;
                if (!/^BUTTON$/i.test(i.tagName)) return !1;
                const n = i.getAttribute("data-tab-link");
                let o, l, a;
                for (l = t.getElementsByClassName("sun-editor-id-tab-content"), o = 0; o < l.length; o++) l[o].style.display = "none";
                for (a = t.getElementsByClassName("sun-editor-id-tab-link"), o = 0; o < a.length; o++) _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(a[o], "active");
                return t.getElementsByClassName("sun-editor-id-tab-content-" + n)[0].style.display = "block", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(i, "active"), "image" === n ? this.context.image.imgInputFile.focus() : "url" === n && this.context.image.imgLink.focus(), !1
            },
            onRender_imgInput: function() {
                const e = function(e) {
                    if (e.length > 0) {
                        const t = this.context.option.imageUploadUrl,
                            i = this.context.dialog.updateModal ? 1 : e.length;
                        if (null !== t && t.length > 0) {
                            const n = new FormData;
                            for (let t = 0; t < i; t++) n.append("file-" + t, e[t]);
                            this.context.image._xmlHttp = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getXMLHttpRequest(), this.context.image._xmlHttp.onreadystatechange = this.plugins.image.callBack_imgUpload.bind(this, this.context.image._linkValue, this.context.image.imgLinkNewWindowCheck.checked, this.context.image.imageX.value + "px", this.context.image._align, this.context.dialog.updateModal, this.context.image._element), this.context.image._xmlHttp.open("post", t, !0), this.context.image._xmlHttp.send(n)
                        } else
                            for (let t = 0; t < i; t++) this.plugins.image.setup_reader.call(this, e[t], this.context.image._linkValue, this.context.image.imgLinkNewWindowCheck.checked, this.context.image.imageX.value + "px", this.context.image._align, t, i - 1)
                    }
                }.bind(this);
                try {
                    e(this.context.image.imgInputFile.files)
                } catch (e) {
                    throw this.closeLoading(), _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, '[SUNEDITOR.imageUpload.fail] cause : "' + e.message + '"'), Error('[SUNEDITOR.imageUpload.fail] cause : "' + e.message + '"')
                }
            },
            setup_reader: function(e, t, i, n, o, l, a) {
                const s = new FileReader;
                this.context.dialog.updateModal && (this.context.image._element.setAttribute("data-file-name", e.name), this.context.image._element.setAttribute("data-file-size", e.size)), s.onload = function(e, r, d) {
                    try {
                        this.plugins.image.create_image.call(this, s.result, t, i, n, o, e, r, d), l === a && this.closeLoading()
                    } catch (e) {
                        throw this.closeLoading(), _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, '[SUNEDITOR.imageFileRendering.fail] cause : "' + e.message + '"'), Error('[SUNEDITOR.imageFileRendering.fail] cause : "' + e.message + '"')
                    }
                }.bind(this, this.context.dialog.updateModal, this.context.image._element, e), s.readAsDataURL(e)
            },
            callBack_imgUpload: function(e, t, i, n, o, l) {
                if (4 === this.context.image._xmlHttp.readyState) {
                    if (200 !== this.context.image._xmlHttp.status) throw _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, "[SUNEDITOR.imageUpload.fail] status: " + this.context.image._xmlHttp.status + ", responseURL: " + this.context.image._xmlHttp.responseURL), this.closeLoading(), Error("[SUNEDITOR.imageUpload.fail] status: " + this.context.image._xmlHttp.status + ", responseURL: " + this.context.image._xmlHttp.responseURL); {
                        const a = JSON.parse(this.context.image._xmlHttp.responseText);
                        if (a.errorMessage) this.closeLoading(), _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, a.errorMessage);
                        else {
                            const s = a.result;
                            for (let a = 0, r = o && s.length > 0 ? 1 : s.length; a < r; a++) this.plugins.image.create_image.call(this, s[a].url, e, t, i, n, o, l, {
                                name: s[a].name,
                                size: s[a].size
                            })
                        }
                        this.closeLoading()
                    }
                }
            },
            onRender_imgUrl: function() {
                if (0 === this.context.image.imgUrlFile.value.trim().length) return !1;
                try {
                    this.plugins.image.create_image.call(this, this.context.image.imgUrlFile.value, this.context.image._linkValue, this.context.image.imgLinkNewWindowCheck.checked, this.context.image.imageX.value + "px", this.context.image._align, this.context.dialog.updateModal, this.context.image._element)
                } catch (e) {
                    throw _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, '[SUNEDITOR.imageURLRendering.fail] cause : "' + e.message + '"'), Error('[SUNEDITOR.imageURLRendering.fail] cause : "' + e.message + '"')
                } finally {
                    this.closeLoading()
                }
            },
            onRender_link: function(e, t, i) {
                if (t.trim().length > 0) {
                    const n = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("A");
                    return n.href = /^https?:\/\//.test(t) ? t : "http://" + t, n.target = i ? "_blank" : "", n.setAttribute("data-image-link", "image"), e.setAttribute("data-image-link", t), n.appendChild(e), n
                }
                return e
            },
            setInputSize: function(e) {
                this.context.dialog.updateModal && this.context.image.proportion.checked && ("x" === e ? this.context.image.imageY.value = Math.round(this.context.image._element_h / this.context.image._element_w * this.context.image.imageX.value) : this.context.image.imageX.value = Math.round(this.context.image._element_w / this.context.image._element_h * this.context.image.imageY.value))
            },
            submit: function(e) {
                this.showLoading(), e.preventDefault(), e.stopPropagation(), this.context.image._linkValue = this.context.image.imgLink.value, this.context.image._altText = this.context.image.altText.value, this.context.image._align = this.context.image.modal.querySelector('input[name="suneditor_image_radio"]:checked').value, this.context.image._captionChecked = this.context.image.captionCheckEl.checked, this.context.image._resizing && (this.context.image._proportionChecked = this.context.image.proportion.checked);
                try {
                    this.context.dialog.updateModal && this.plugins.image.update_image.call(this), this.context.image.imgInputFile && this.context.image.imgInputFile.files.length > 0 ? this.plugins.image.onRender_imgInput.call(this) : this.context.image.imgUrlFile && this.context.image.imgUrlFile.value.trim().length > 0 ? this.plugins.image.onRender_imgUrl.call(this) : this.closeLoading()
                } catch (e) {
                    throw this.closeLoading(), _modules_notice__WEBPACK_IMPORTED_MODULE_3__.a.open.call(this, '[SUNEDITOR.image.submit.fail] cause : "' + e.message + '"'), Error('[SUNEDITOR.image.submit.fail] cause : "' + e.message + '"')
                } finally {
                    this.plugins.dialog.close.call(this)
                }
                return !1
            },
            _onload_image: function(e, t) {
                if (/\d+/.test(e.style.width) && (e.style.height = e.offsetHeight + "px"), e.setAttribute("origin-size", e.naturalWidth + "," + e.naturalHeight), e.setAttribute("data-origin", e.offsetWidth + "," + e.offsetHeight), !t) return;
                let i = e.getAttribute("data-index");
                if (i) {
                    const t = this._variable._imagesInfo[i];
                    t.name = e.getAttribute("data-file-name"), t.size = 1 * e.getAttribute("data-file-size")
                } else i = this._variable._imageIndex, e.setAttribute("data-index", i), this._variable._imagesInfo[i] = {
                    index: i,
                    name: t.name,
                    size: t.size,
                    select: function() {
                        const t = this.plugins.resizing.call_controller_resize.call(this, e, "image");
                        this.plugins.image.onModifyMode.call(this, e, t), e.scrollIntoView()
                    }.bind(this),
                    delete: this.plugins.image.destroy.bind(this, e)
                }, this._variable._imageIndex++, e.setAttribute("data-file-name", t.name), e.setAttribute("data-file-size", t.size);
                this._imageUpload(e, i, !1)
            },
            create_image: function(e, t, i, n, o, l, a, s) {
                if (l) return void(a.src = e);
                const r = this.context.image;
                let d = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("IMG");
                d.addEventListener("load", this.plugins.image._onload_image.bind(this, d, s)), d.src = e, d.setAttribute("data-align", o), d.alt = r._altText, (d = this.plugins.image.onRender_link(d, t, i)).setAttribute("data-rotate", "0"), r._resizing && (/\d+/.test(n) && (d.style.width = n), d.setAttribute("data-proportion", r._proportionChecked));
                const c = this.plugins.resizing.set_cover.call(this, d),
                    _ = this.plugins.resizing.set_container.call(this, c, "sun-editor-id-image-container");
                r._captionChecked && (r._caption = this.plugins.resizing.create_caption.call(this), r._caption.setAttribute("contenteditable", !1), c.appendChild(r._caption)), c.style.margin = "none" !== o ? "auto" : "0", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(_, r._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(_, "float-" + o), r._resizing && /\d+/.test(n) || (this.context.resizing._resize_plugin = "image", r._element = d, r._cover = c, r._container = _, this.plugins.image.setAutoSize.call(this)), this.insertNode(_, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(this.getSelectionNode())), this.appendFormatTag(_)
            },
            update_image: function() {
                const e = this.context.image,
                    t = e._linkValue;
                let i = e._element,
                    n = e._cover,
                    o = e._container,
                    l = !1;
                const a = 1 * e.imageX.value !== i.offsetWidth || 1 * e.imageY.value !== i.offsetHeight;
                if (null === n && (l = !0, i = e._element.cloneNode(!0), n = this.plugins.resizing.set_cover.call(this, i)), null === o && (n = n.cloneNode(!0), l = !0, o = this.plugins.resizing.set_container.call(this, n, "sun-editor-id-image-container")), l && (o.innerHTML = "", o.appendChild(n)), i.alt = e._altText, e._resizing && (i.setAttribute("data-proportion", e._proportionChecked), a && this.plugins.image.setSize.call(this, e.imageX.value, e.imageY.value)), e._captionChecked ? e._caption || (e._caption = this.plugins.resizing.create_caption.call(this), n.appendChild(e._caption)) : e._caption && (_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(e._caption), e._caption = null), e._align && "none" !== e._align ? n.style.margin = "auto" : n.style.margin = "0", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(o, this.context.image._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(o, "float-" + e._align), i.setAttribute("data-align", e._align), t.trim().length > 0)
                    if (null !== e._linkElement) e._linkElement.href = t, e._linkElement.target = e.imgLinkNewWindowCheck.checked ? "_blank" : "", i.setAttribute("data-image-link", t);
                    else {
                        let o = this.plugins.image.onRender_link(i, t, this.context.image.imgLinkNewWindowCheck.checked);
                        n.insertBefore(o, e._caption)
                    }
                else if (null !== e._linkElement) {
                    const t = i;
                    t.setAttribute("data-image-link", "");
                    let o = t.cloneNode(!0);
                    n.removeChild(e._linkElement), n.insertBefore(o, e._caption), i = o
                }
                if (l) {
                    const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(e._element);
                    t.parentNode.insertBefore(o, t), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(t)
                }(e._resizing && a || this.context.resizing._rotateVertical && e._captionChecked) && this.plugins.resizing.setTransformSize.call(this, i)
            },
            sizeRevert: function() {
                const e = this.context.image;
                e._origin_w && (e.imageX.value = e._element_w = e._origin_w, e.imageY.value = e._element_h = e._origin_h)
            },
            onModifyMode: function(e, t) {
                const i = this.context.image;
                i._linkElement = /^A$/i.test(e.parentNode.nodeName) ? e.parentNode : null, i._element = e, i._cover = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-figure-cover"), i._container = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-id-image-container"), i._caption = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getChildElement(i._cover, "FIGCAPTION"), i._align = e.getAttribute("data-align") || "none", i._element_w = t.w, i._element_h = t.h, i._element_t = t.t, i._element_l = t.l;
                let n = i._element.getAttribute("data-origin");
                n ? (n = n.split(","), i._origin_w = 1 * n[0], i._origin_h = 1 * n[1]) : (i._origin_w = t.w, i._origin_h = t.h, i._element.setAttribute("data-origin", t.w + "," + t.h))
            },
            openModify: function(e) {
                const t = this.context.image;
                t.imgUrlFile.value = t._element.src, t.altText.value = t._element.alt, t.imgLink.value = null === t._linkElement ? "" : t._linkElement.href, t.imgLinkNewWindowCheck.checked = t._linkElement && "_blank" === t._linkElement.target, t.modal.querySelector('input[name="suneditor_image_radio"][value="' + t._align + '"]').checked = !0, t._captionChecked = t.captionCheckEl.checked = !!t._caption, t._resizing && (t.proportion.checked = t._proportionChecked = "true" === t._element.getAttribute("data-proportion"), t.imageX.value = t._element.offsetWidth, t.imageY.value = t._element.offsetHeight, t.imageX.disabled = !1, t.imageY.disabled = !1, t.proportion.disabled = !1), e || this.plugins.dialog.open.call(this, "image", !0)
            },
            setSize: function(e, t) {
                const i = this.context.image;
                i._element.style.width = e + "px", i._element.style.height = t + "px"
            },
            setAutoSize: function() {
                const e = this.context.image;
                this.plugins.resizing.resetTransform.call(this, e._element), this.plugins.image.cancelPercentAttr.call(this), e._element.style.maxWidth = "100%", e._element.style.width = "100%", e._element.style.height = "", e._cover.style.width = "", e._cover.style.height = ""
            },
            setPercentSize: function(e) {
                const t = this.context.image;
                t._container.style.width = e, t._container.style.height = "", t._cover.style.width = "100%", t._cover.style.height = "", t._element.style.width = "100%", t._element.style.height = "", /100/.test(e) && (_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(t._container, this.context.image._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(t._container, "float-center"))
            },
            cancelPercentAttr: function() {
                const e = this.context.image;
                e._element.style.maxWidth = "none", e._cover.style.width = "", e._cover.style.height = "", e._container.style.width = "", e._container.style.height = "", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(e._container, this.context.image._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(e._container, "float-" + e._align)
            },
            resetAlign: function() {
                const e = this.context.image;
                e._element.setAttribute("data-align", ""), e._align = "none", e._cover.style.margin = "0", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(e._container, e._floatClassRegExp)
            },
            destroy: function(e) {
                const t = e || this.context.image._element,
                    i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(t, ".sun-editor-id-image-container") || t,
                    n = t.getAttribute("data-index");
                _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(i), this.plugins.image.init.call(this), this.controllersOff(), n && (delete this._variable._imagesInfo[n], this._imageUpload(t, n, !0))
            },
            init: function() {
                const e = this.context.image;
                if (e.imgInputFile && (e.imgInputFile.value = ""), e.imgUrlFile && (e.imgUrlFile.value = ""), e.altText.value = "", e.imgLink.value = "", e.imgLinkNewWindowCheck.checked = !1, e.modal.querySelector('input[name="suneditor_image_radio"][value="none"]').checked = !0, e.captionCheckEl.checked = !1, e._element = null, this.plugins.image.openTab.call(this, "init"), e._resizing) {
                    const t = "auto" === this.context.option.imageWidth;
                    e.proportion.checked = !1, e.imageX.value = t ? "" : this.context.option.imageWidth, e.imageY.value = "", e.imageX.disabled = t, e.imageY.disabled = !0, e.proportion.disabled = !0
                }
            }
        }
    },
    MIhV: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "fontSize",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.context.option));
                listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                t.className = "sun-editor-submenu layer_editor layer_size", t.style.display = "none";
                const i = e.fontSize ? e.fontSize : [8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72];
                let n = '<div class="inner_layer">   <ul class="list_editor font_size_list">';
                for (let e = 0, t = i.length; e < t; e++) {
                    const t = i[e];
                    n += '<li><button type="button" class="btn_edit" data-value="' + t + '" title="' + t + '" style="font-size:' + t + 'px;">' + t + "</button></li>"
                }
                return n += "   </ul></div>", t.innerHTML = n, t
            },
            pickup: function(e) {
                if (e.preventDefault(), e.stopPropagation(), !/^BUTTON$/i.test(e.target.tagName)) return !1;
                _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(this.context.tool.fontSize, e.target.getAttribute("data-value"));
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("SPAN");
                t.style.fontSize = e.target.getAttribute("data-value") + "px", this.nodeChange(t, ["font-size"]), this.submenuOff(), this.focus()
            }
        }
    },
    PAX9: function(e, t, i) {
        "use strict";
        var n = i("8e1d");
        t.a = {
            name: "notice",
            add: function(e) {
                const t = e.context;
                t.notice = {};
                let i = n.a.createElement("DIV"),
                    o = n.a.createElement("SPAN"),
                    l = n.a.createElement("BUTTON");
                i.className = "sun-editor-id-notice", l.className = "close", l.setAttribute("aria-label", "Close"), l.setAttribute("title", e.lang.dialogBox.close), l.innerHTML = '<div aria-hidden="true" data-command="close" class="icon-cancel"></div>', i.appendChild(o), i.appendChild(l), t.notice.modal = i, t.notice.message = o, l.addEventListener("click", this.onClick_cancel.bind(e)), t.element.editorArea.insertBefore(i, t.element.wysiwyg), i = null
            },
            onClick_cancel: function(e) {
                e.preventDefault(), e.stopPropagation(), this.plugins.notice.close.call(this)
            },
            open: function(e) {
                this.context.notice.message.textContent = e, this.context.notice.modal.style.display = "block"
            },
            close: function() {
                this.context.notice.modal.style.display = "none"
            }
        }
    },
    Rp48: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d"),
            _modules_dialog__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__("1kvd");
        __webpack_exports__.a = {
            name: "link",
            add: function(core) {
                core.addModule([_modules_dialog__WEBPACK_IMPORTED_MODULE_1__.a]);
                const context = core.context;
                context.link = {};
                let link_dialog = eval(this.setDialog(core.lang));
                context.link.modal = link_dialog, context.link.focusElement = link_dialog.getElementsByClassName("sun-editor-id-link-url")[0], context.link.linkAnchorText = link_dialog.getElementsByClassName("sun-editor-id-link-text")[0], context.link.linkNewWindowCheck = link_dialog.getElementsByClassName("sun-editor-id-link-check")[0];
                let link_button = eval(this.setController_LinkButton(core.lang));
                context.link.linkBtn = link_button, context.link._linkAnchor = null, link_button.addEventListener("mousedown", function(e) {
                    e.stopPropagation()
                }, !1), link_dialog.getElementsByClassName("btn-primary")[0].addEventListener("click", this.submit.bind(core)), link_button.addEventListener("click", this.onClick_linkBtn.bind(core)), context.dialog.modal.appendChild(link_dialog), context.element.relative.appendChild(link_button), link_dialog = null, link_button = null
            },
            setDialog: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "modal-content sun-editor-id-dialog-link", t.style.display = "none", t.innerHTML = '<form class="editor_link">   <div class="modal-header">       <button type="button" data-command="close" class="close" aria-label="Close" title="' + e.dialogBox.close + '">           <div aria-hidden="true" data-command="close" class="icon-cancel"></div>       </button>       <h5 class="modal-title">' + e.dialogBox.linkBox.title + '</h5>   </div>   <div class="modal-body">       <div class="form-group">           <label>' + e.dialogBox.linkBox.url + '</label>           <input class="form-control sun-editor-id-link-url" type="text" />       </div>       <div class="form-group">           <label>' + e.dialogBox.linkBox.text + '</label><input class="form-control sun-editor-id-link-text" type="text" />       </div>       <label><input type="checkbox" class="sun-editor-id-link-check" />&nbsp;' + e.dialogBox.linkBox.newWindowCheck + '</label>   </div>   <div class="modal-footer">       <button type="submit" class="btn btn-primary sun-editor-id-submit-link" title="' + e.dialogBox.submitButton + '"><span>' + e.dialogBox.submitButton + "</span></button>   </div></form>", t
            },
            setController_LinkButton: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-id-link-btn", t.style.display = "none", t.innerHTML = '<div class="arrow arrow-up"></div><div class="link-content"><span><a target="_blank" href=""></a>&nbsp;</span>   <div class="btn-group">     <button type="button" data-command="update" tabindex="-1" title="' + e.controller.edit + '"><div class="icon-link"></div></button>     <button type="button" data-command="delete" tabindex="-1" title="' + e.controller.remove + '"><div class="icon-delete"></div></button>   </div></div>', t
            },
            submit: function(e) {
                this.showLoading(), e.preventDefault(), e.stopPropagation();
                const t = function() {
                    if (0 === this.context.link.focusElement.value.trim().length) return !1;
                    const e = this.context.link.focusElement.value,
                        t = this.context.link.linkAnchorText,
                        i = 0 === t.value.length ? e : t.value;
                    if (this.context.dialog.updateModal) this.context.link._linkAnchor.href = e, this.context.link._linkAnchor.textContent = i, this.context.link._linkAnchor.target = this.context.link.linkNewWindowCheck.checked ? "_blank" : "", this.setRange(this.context.link._linkAnchor.childNodes[0], 0, this.context.link._linkAnchor.childNodes[0], this.context.link._linkAnchor.textContent.length);
                    else {
                        const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("A");
                        t.href = e, t.textContent = i, t.target = this.context.link.linkNewWindowCheck.checked ? "_blank" : "", this.insertNode(t), this.setRange(t.childNodes[0], 0, t.childNodes[0], t.textContent.length)
                    }
                    this.context.link.focusElement.value = "", this.context.link.linkAnchorText.value = ""
                }.bind(this);
                try {
                    t()
                } finally {
                    this.plugins.dialog.close.call(this), this.closeLoading(), this.focus()
                }
                return !1
            },
            call_controller_linkButton: function(e) {
                this.editLink = this.context.link._linkAnchor = e;
                const t = this.context.link.linkBtn;
                t.getElementsByTagName("A")[0].href = e.href, t.getElementsByTagName("A")[0].textContent = e.textContent;
                const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getOffset(e);
                t.style.left = i.left - this.context.element.wysiwyg.scrollLeft + "px", t.style.top = i.top + e.offsetHeight + 10 + "px", t.style.display = "block", this.controllersOn(t)
            },
            onClick_linkBtn: function(e) {
                e.stopPropagation();
                const t = e.target.getAttribute("data-command") || e.target.parentNode.getAttribute("data-command");
                t && (e.preventDefault(), /update/.test(t) ? (this.context.link.focusElement.value = this.context.link._linkAnchor.href, this.context.link.linkAnchorText.value = this.context.link._linkAnchor.textContent, this.context.link.linkNewWindowCheck.checked = !!/_blank/i.test(this.context.link._linkAnchor.target), this.plugins.dialog.open.call(this, "link", !0)) : (_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(this.context.link._linkAnchor), this.context.link._linkAnchor = null, this.focus()), this.controllersOff())
            },
            init: function() {
                const e = this.context.link;
                e.linkBtn.style.display = "none", e._linkAnchor = null, e.focusElement.value = "", e.linkAnchorText.value = "", e.linkNewWindowCheck.checked = !1
            }
        }
    },
    VquE: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "table",
            add: function(core, targetElement) {
                const context = core.context;
                context.table = {
                    _element: null,
                    _tdElement: null,
                    _trElement: null,
                    _trElements: null,
                    _tdIndex: 0,
                    _trIndex: 0,
                    _tdCnt: 0,
                    _trCnt: 0,
                    _tableXY: []
                };
                let listDiv = eval(this.setSubmenu()),
                    tablePicker = listDiv.getElementsByClassName("sun-editor-id-table-picker")[0];
                context.table.tableHighlight = listDiv.getElementsByClassName("sun-editor-id-table-highlighted")[0], context.table.tableUnHighlight = listDiv.getElementsByClassName("sun-editor-id-table-unhighlighted")[0], context.table.tableDisplay = listDiv.getElementsByClassName("sun-editor-table-display")[0];
                let resizeDiv = eval(this.setController_tableEditor(core.lang));
                context.table.resizeDiv = resizeDiv, resizeDiv.addEventListener("mousedown", function(e) {
                    e.stopPropagation()
                }, !1), tablePicker.addEventListener("mousemove", this.onMouseMove_tablePicker.bind(core)), tablePicker.addEventListener("click", this.appendTable.bind(core)), resizeDiv.addEventListener("click", this.onClick_resizeDiv.bind(core)), targetElement.parentNode.appendChild(listDiv), context.element.relative.appendChild(resizeDiv), listDiv = null, tablePicker = null, resizeDiv = null
            },
            setSubmenu: function() {
                const e = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return e.className = "sun-editor-submenu table-content", e.style.display = "none", e.innerHTML = '<div class="table-data-form">   <div class="table-picker sun-editor-id-table-picker"></div>   <div class="table-highlighted sun-editor-id-table-highlighted"></div>   <div class="table-unhighlighted sun-editor-id-table-unhighlighted"></div></div><div class="table-display sun-editor-table-display">1 x 1</div>', e
            },
            setController_tableEditor: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-id-table-edit", t.style.display = "none", t.innerHTML = '<div class="arrow arrow-up"></div><div>   <div class="btn-group">     <button type="button" data-command="insert" data-value="row" data-option="up" title="' + e.controller.insertRowAbove + '"><div class="icon-insert-row-above"></div></button>     <button type="button" data-command="insert" data-value="row" data-option="down" title="' + e.controller.insertRowBelow + '"><div class="icon-insert-row-below"></div></button>     <button type="button" data-command="delete" data-value="row" title="' + e.controller.deleteRow + '"><div class="icon-delete-row"></div></button>   </div></div><div style="margin-top: -5px;">   <div class="btn-group">     <button type="button" data-command="insert" data-value="cell" data-option="left" title="' + e.controller.insertColumnBefore + '"><div class="icon-insert-column-left"></div></button>     <button type="button" data-command="insert" data-value="cell" data-option="right" title="' + e.controller.insertColumnAfter + '"><div class="icon-insert-column-right"></div></button>     <button type="button" data-command="delete" data-value="cell" title="' + e.controller.deleteColumn + '"><div class="icon-delete-column"></div></button>     <button type="button" data-command="remove" title="' + e.controller.remove + '"><div class="icon-delete"></div></button>   </div></div>', t
            },
            appendTable: function() {
                const e = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("TABLE");
                let t = this.context.table._tableXY[0],
                    i = this.context.table._tableXY[1],
                    n = "<tbody>";
                for (; i > 0;) {
                    n += "<tr>";
                    let e = t;
                    for (; e > 0;) n += "<td><div>" + _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.zeroWidthSpace + "</div></td>", --e;
                    n += "</tr>", --i
                }
                n += "</tbody>", e.innerHTML = n;
                const o = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(this.getSelectionNode());
                this.insertNode(e, /^LI$/i.test(o.nodeName) ? _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getRangeFormatElement(o) : o), this.appendFormatTag(e), this.focus(), this.plugins.table.reset_table_picker.call(this)
            },
            onMouseMove_tablePicker: function(e) {
                e.stopPropagation();
                let t = Math.ceil(e.offsetX / 18),
                    i = Math.ceil(e.offsetY / 18);
                t = t < 1 ? 1 : t, i = i < 1 ? 1 : i, this.context.table.tableHighlight.style.width = t + "em", this.context.table.tableHighlight.style.height = i + "em";
                let n = t < 5 ? 5 : t > 9 ? 10 : t + 1,
                    o = i < 5 ? 5 : i > 9 ? 10 : i + 1;
                this.context.table.tableUnHighlight.style.width = n + "em", this.context.table.tableUnHighlight.style.height = o + "em", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(this.context.table.tableDisplay, t + " x " + i), this.context.table._tableXY = [t, i]
            },
            reset_table_picker: function() {
                if (!this.context.table.tableHighlight) return;
                const e = this.context.table.tableHighlight.style,
                    t = this.context.table.tableUnHighlight.style;
                e.width = "1em", e.height = "1em", t.width = "5em", t.height = "5em", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(this.context.table.tableDisplay, "1 x 1"), this.submenuOff()
            },
            init: function() {
                const e = this.context.table;
                e._tdElement && _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(e._tdElement, "sun-editor-selected-cell"), e._element = null, e._tdElement = null, e._trElement = null, e._trElements = 0, e._tdIndex = 0, e._trIndex = 0, e._trCnt = 0, e._tdCnt = 0, e._tableXY = []
            },
            call_controller_tableEdit: function(e) {
                this.plugins.table.init.call(this);
                const t = this.context.table.resizeDiv;
                this.plugins.table.setPositionControllerDiv.call(this, e, !1), t.style.display = "block", this.controllersOn(t)
            },
            setPositionControllerDiv: function(e, t) {
                const i = this.context.table,
                    n = i.resizeDiv;
                let o = i._element;
                if (!o) {
                    for (o = e; !/^TABLE$/i.test(o.nodeName);) o = o.parentNode;
                    i._element = o
                }
                i._tdElement !== e && (i._tdElement && _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(i._tdElement, "sun-editor-selected-cell"), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(e, "sun-editor-selected-cell"), i._tdElement = e, i._trElement = e.parentNode), (t || 0 === i._trCnt) && (i._trElements = o.rows, i._tdIndex = e.cellIndex, i._trIndex = i._trElement.rowIndex, i._trCnt = o.rows.length, i._tdCnt = i._trElement.cells.length);
                const l = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getOffset(e);
                n.style.left = l.left - this.context.element.wysiwyg.scrollLeft + "px", n.style.top = l.top + e.offsetHeight + 12 + "px"
            },
            insertRowCell: function(e, t) {
                const i = this.context.table;
                if ("row" === e) {
                    const e = "up" === t ? i._trIndex : i._trIndex + 1;
                    let n = "";
                    for (let e = 0, t = i._tdCnt; e < t; e++) n += "<td><div>" + _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.zeroWidthSpace + "</div></td>";
                    i._element.insertRow(e).innerHTML = n
                } else {
                    const e = i._trElements,
                        n = "left" === t ? i._tdIndex : i._tdIndex + 1;
                    let o = null;
                    for (let t = 0, l = i._trCnt; t < l; t++)(o = e[t].insertCell(n)).innerHTML = "<div>" + _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.zeroWidthSpace + "</div>"
                }
                this.plugins.table.setPositionControllerDiv.call(this, i._tdElement, !0)
            },
            deleteRowCell: function(e) {
                const t = this.context.table;
                if ("row" === e) t._element.deleteRow(t._trIndex);
                else {
                    const e = t._trElements,
                        i = t._tdIndex;
                    for (let n = 0, o = t._trCnt; n < o; n++) e[n].deleteCell(i)
                }
                this.controllersOff()
            },
            onClick_resizeDiv: function(e) {
                e.stopPropagation();
                const t = e.target,
                    i = t.getAttribute("data-command") || t.parentNode.getAttribute("data-command"),
                    n = t.getAttribute("data-value") || t.parentNode.getAttribute("data-value"),
                    o = t.getAttribute("data-option") || t.parentNode.getAttribute("data-option");
                if (!i) return;
                e.preventDefault();
                const l = this.context.table;
                switch (i) {
                    case "insert":
                        this.plugins.table.insertRowCell.call(this, n, o);
                        break;
                    case "delete":
                        this.plugins.table.deleteRowCell.call(this, n);
                        break;
                    case "remove":
                        _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(l._element), this.controllersOff(), this.focus()
                }
            }
        }
    },
    WRt5: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "align",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.lang));
                listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "layer_editor layer_align", t.style.display = "none", t.innerHTML = '<div class="sun-editor-submenu inner_layer">   <ul class="list_editor">       <li><button type="button" class="btn_edit btn_align" data-command="justifyleft" title="' + e.toolbar.alignLeft + '"><span class="img_editor icon-align-left"></span>' + e.toolbar.alignLeft + '</button></li>       <li><button type="button" class="btn_edit btn_align" data-command="justifycenter" title="' + e.toolbar.alignCenter + '"><span class="img_editor icon-align-center"></span>' + e.toolbar.alignCenter + '</button></li>       <li><button type="button" class="btn_edit btn_align" data-command="justifyright" title="' + e.toolbar.alignRight + '"><span class="img_editor icon-align-right"></span>' + e.toolbar.alignRight + '</button></li>       <li><button type="button" class="btn_edit btn_align" data-command="justifyfull" title="' + e.toolbar.justifyFull + '"><span class="img_editor icon-align-just"></span>' + e.toolbar.justifyFull + "</button></li>   </ul></div>", t
            },
            pickup: function(e) {
                e.preventDefault(), e.stopPropagation();
                let t = e.target,
                    i = null;
                for (; !i && !/UL/i.test(t.tagName);) i = t.getAttribute("data-command"), t = t.parentNode;
                this.focus(), this.execCommand(i, !1, null), this.submenuOff()
            }
        }
    },
    WUQj: function(e, t, i) {},
    WzUB: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "formatBlock",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.lang));
                listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickUp.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-submenu layer_editor layer_block", t.style.display = "none", t.innerHTML = '<div class="inner_layer">   <ul class="list_editor format_list">       <li><button type="button" class="btn_edit" data-command="replace" data-value="P" title="' + e.toolbar.tag_p + '"><p>' + e.toolbar.tag_p + '</p></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="DIV" title="' + e.toolbar.tag_div + '"><div>' + e.toolbar.tag_div + '</div></button></li>       <li><button type="button" class="btn_edit" data-command="range" data-value="BLOCKQUOTE" title="' + e.toolbar.tag_quote + '">               <blockquote>' + e.toolbar.tag_quote + '</blockquote>           </button>       </li>       <li><button type="button" class="btn_edit" data-command="range" data-value="PRE" title="' + e.toolbar.pre + '">               <pre>' + e.toolbar.pre + '</pre>           </button>       </li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H1" title="' + e.toolbar.tag_h + ' 1"><h1>' + e.toolbar.tag_h + ' 1</h1></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H2" title="' + e.toolbar.tag_h + ' 2"><h2>' + e.toolbar.tag_h + ' 2</h2></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H3" title="' + e.toolbar.tag_h + ' 3"><h3>' + e.toolbar.tag_h + ' 3</h3></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H4" title="' + e.toolbar.tag_h + ' 4"><h4>' + e.toolbar.tag_h + ' 4</h4></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H5" title="' + e.toolbar.tag_h + ' 5"><h5>' + e.toolbar.tag_h + ' 5</h5></button></li>       <li><button type="button" class="btn_edit" data-command="replace" data-value="H6" title="' + e.toolbar.tag_h + ' 6"><h6>' + e.toolbar.tag_h + " 6</h6></button></li>   </ul></div>", t
            },
            pickUp: function(e) {
                e.preventDefault(), e.stopPropagation();
                let t = e.target,
                    i = null,
                    n = null;
                for (; !i && !/UL/i.test(t.tagName);) i = t.getAttribute("data-command"), n = t.getAttribute("data-value"), t = t.parentNode;
                if ("range" === i) {
                    const e = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement(n);
                    this.wrapToTags(e), this.setRange(e.firstChild, 0, e.firstChild, 0), this.appendFormatTag(e, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.isCell(this.getSelectionNode()) ? "DIV" : "")
                } else this.execCommand("formatBlock", !1, n), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(this.commandMap.FORMAT, n);
                this.submenuOff(), this.focus()
            }
        }
    },
    XJR1: function(e, t, i) {
        "use strict";
        i.r(t);
        i("3FqI"), i("WUQj");
        var n = i("WRt5"),
            o = i("50IV"),
            l = i("MIhV"),
            a = i("0A7J"),
            s = i("s0fJ"),
            r = i("g4XY"),
            d = i("gMuy"),
            c = i("VquE"),
            _ = i("WzUB"),
            u = i("Rp48"),
            g = i("KKur"),
            m = i("hlhS"),
            h = {
                align: n.a,
                font: o.a,
                fontSize: l.a,
                fontColor: a.a,
                hiliteColor: s.a,
                horizontalRule: r.a,
                list: d.a,
                table: c.a,
                formatBlock: _.a,
                link: u.a,
                image: g.a,
                video: m.a
            },
            p = i("8e1d"),
            f = i("PAX9");
        var b = function(e, t, i) {
            const n = document,
                o = window,
                l = {
                    context: e,
                    plugins: {},
                    initPlugins: {},
                    lang: i,
                    dialogForm: null,
                    _submenuName: "",
                    submenu: null,
                    _bindedSubmenuOff: null,
                    submenuActiveButton: null,
                    controllerArray: [],
                    _bindControllersOff: null,
                    codeViewDisabledButtons: e.element.toolbar.querySelectorAll('.sun-editor-id-toolbar button:not([class~="code-view-enabled"])'),
                    _isInline: /inline/i.test(e.option.mode),
                    _isBalloon: /balloon/i.test(e.option.mode),
                    _inlineToolbarAttr: {
                        width: 0,
                        height: 0,
                        isShow: !1
                    },
                    _imageUpload: function(e, t, i) {
                        s.onImageUpload && s.onImageUpload(e, t, i)
                    },
                    commandMap: {
                        FORMAT: e.tool.format,
                        FONT: e.tool.font,
                        SIZE: e.tool.fontSize,
                        B: e.tool.bold,
                        U: e.tool.underline,
                        I: e.tool.italic,
                        STRIKE: e.tool.strike,
                        SUB: e.tool.subscript,
                        SUP: e.tool.superscript
                    },
                    _variable: {
                        wysiwygActive: !0,
                        isFullScreen: !1,
                        innerHeight_fullScreen: 0,
                        resizeClientY: 0,
                        tabSize: 4,
                        minResizingSize: 65,
                        currentNodes: [],
                        _range: null,
                        _selectionNode: null,
                        _originCssText: e.element.topArea.style.cssText,
                        _bodyOverflow: "",
                        _editorAreaOriginCssText: "",
                        _wysiwygOriginCssText: "",
                        _codeOriginCssText: "",
                        _sticky: !1,
                        _imagesInfo: [],
                        _imageIndex: 0
                    },
                    callPlugin: function(e, t) {
                        if (!this.plugins[e]) throw Error('[SUNEDITOR.core.callPlugin.fail] The called plugin does not exist or is in an invalid format. (pluginName:"' + e + '")');
                        this.initPlugins[e] || (this.plugins[e].add(this, this.plugins[e].buttonElement), this.initPlugins[e] = !0), t()
                    },
                    addModule: function(e) {
                        let t = "";
                        for (let i = 0, n = e.length; i < n; i++) t = e[i].name, this.plugins[t] || (this.plugins[t] = p.a.copyObj(e[i]), this.plugins[t].add(this))
                    },
                    submenuOn: function(e) {
                        const t = this._submenuName = e.getAttribute("data-command");
                        this.plugins[t].on && this.plugins[t].on.call(this), this.submenu = e.nextElementSibling, this.submenu.style.display = "block", p.a.addClass(e, "on"), this.submenuActiveButton = e;
                        const i = this.context.element.toolbar.offsetWidth - (e.parentElement.offsetLeft + this.submenu.offsetWidth);
                        this.submenu.style.left = i < 0 ? i + "px" : "1px", this._bindedSubmenuOff = this.submenuOff.bind(this), n.addEventListener("mousedown", this._bindedSubmenuOff, !1)
                    },
                    submenuOff: function() {
                        this.submenu && (this._submenuName = "", this.submenu.style.display = "none", this.submenu = null, p.a.removeClass(this.submenuActiveButton, "on"), this.submenuActiveButton = null, n.removeEventListener("mousedown", this._bindedSubmenuOff)), this.controllersOff()
                    },
                    controllersOn: function() {
                        for (let e = 0; e < arguments.length; e++) arguments[e].style.display = "block", this.controllerArray[e] = arguments[e];
                        this._bindControllersOff = this.controllersOff.bind(this), n.addEventListener("mousedown", this._bindControllersOff, !1)
                    },
                    controllersOff: function() {
                        const e = this.controllerArray.length;
                        if (e > 0) {
                            for (let t = 0; t < e; t++) this.controllerArray[t].style.display = "none";
                            this.controllerArray = [], n.removeEventListener("mousedown", this._bindControllersOff)
                        }
                    },
                    execCommand: function(e, t, i) {
                        n.execCommand(e, t, "formatBlock" === e ? "<" + i + ">" : i)
                    },
                    focus: function() {
                        if ("none" === e.element.wysiwyg.style.display) return;
                        const t = p.a.getParentElement(this.getSelectionNode(), "figcaption");
                        t ? t.focus() : e.element.wysiwyg.focus(), a._findButtonEffectTag()
                    },
                    setRange: function(e, t, i, l) {
                        const a = n.createRange();
                        a.setStart(e, t), a.setEnd(i, l);
                        const s = o.getSelection();
                        s.removeAllRanges && s.removeAllRanges(), s.addRange(a), this._editorRange()
                    },
                    getRange: function() {
                        return this._variable._range || this._createDefaultRange()
                    },
                    getSelectionNode: function() {
                        return this._variable._selectionNode || e.element.wysiwyg.firstChild
                    },
                    _editorRange: function() {
                        const e = o.getSelection();
                        if (!p.a.getParentElement(e.focusNode, ".sun-editor-id-wysiwyg")) return;
                        let t = null,
                            i = null;
                        t = e.rangeCount > 0 ? e.getRangeAt(0) : this._createDefaultRange(), this._variable._range = t, i = t.collapsed ? t.commonAncestorContainer : e.extentNode || e.anchorNode, this._variable._selectionNode = i
                    },
                    _createDefaultRange: function() {
                        const t = n.createRange();
                        return t.setStart(e.element.wysiwyg.firstChild, 0), t.setEnd(e.element.wysiwyg.firstChild, 0), t
                    },
                    getSelectedFormatElements: function() {
                        let t = this.getRange();
                        if (p.a.isWysiwygDiv(t.startContainer)) {
                            const i = e.element.wysiwyg.children;
                            this.setRange(i[0], 0, i[i.length - 1], i[i.length - 1].textContent.length), t = this.getRange()
                        }
                        const i = t.startContainer,
                            n = t.endContainer,
                            o = t.commonAncestorContainer,
                            l = [];
                        if (!p.a.isWysiwygDiv(o) && !p.a.isRangeFormatElement(o)) return [p.a.getFormatElement(o)];
                        const a = p.a.getListChildren(o, function(e) {
                            return p.a.isFormatElement(e)
                        });
                        if (i === n) return a[0];
                        let s = p.a.getFormatElement(i),
                            r = p.a.getFormatElement(n),
                            d = 0,
                            c = 0;
                        for (let e = 0, t = a.length; e < t; e++)
                            if (s !== a[e]) {
                                if (r === a[e]) {
                                    c = e;
                                    break
                                }
                            } else d = e;
                        for (let e = d; e <= c; e++) l.push(a[e]);
                        return l
                    },
                    getSelectedRangeFormatElements: function() {
                        let t = this.getRange();
                        if (p.a.isWysiwygDiv(t.startContainer)) {
                            const i = e.element.wysiwyg.children;
                            this.setRange(i[0], 0, i[i.length - 1], i[i.length - 1].textContent.length), t = this.getRange()
                        }
                        const i = t.startContainer,
                            n = t.endContainer,
                            o = t.commonAncestorContainer,
                            l = [];
                        if (p.a.isRangeFormatElement(o)) return [o];
                        if (!p.a.isWysiwygDiv(o)) {
                            const e = p.a.getRangeFormatElement(o);
                            return e ? [e] : []
                        }
                        const a = p.a.getListChildren(o, function(e) {
                            return p.a.isRangeFormatElement(e)
                        });
                        if (i === n) return a[0];
                        let s = p.a.getRangeFormatElement(i),
                            r = p.a.getRangeFormatElement(n),
                            d = 0,
                            c = 0;
                        for (let e = 0, t = a.length; e < t; e++)
                            if (s !== a[e]) {
                                if (r === a[e]) {
                                    c = e;
                                    break
                                }
                            } else d = e;
                        for (let e = d; e <= c; e++) a[e] && l.push(a[e]);
                        return l
                    },
                    isEdgePoint: function(e, t) {
                        return 0 === t || t === e.nodeValue.length
                    },
                    showLoading: function() {
                        e.element.loading.style.display = "block"
                    },
                    closeLoading: function() {
                        e.element.loading.style.display = "none"
                    },
                    appendFormatTag: function(e, t) {
                        const i = p.a.getRangeFormatElement(e) || p.a.getFormatElement(e),
                            n = p.a.getFormatElement(this.getSelectionNode()),
                            o = t || (p.a.isFormatElement(n) ? n.nodeName : "P"),
                            l = p.a.createElement(o);
                        return l.innerHTML = p.a.zeroWidthSpace, p.a.isCell(i) ? i.insertBefore(l, e.nextElementSibling) : i.parentNode.insertBefore(l, i.nextElementSibling), l
                    },
                    insertNode: function(e, t) {
                        const i = this.getRange();
                        let n = null;
                        if (t) n = t.parentNode, t = t.nextSibling;
                        else {
                            const e = i.startContainer,
                                o = i.startOffset,
                                l = i.endContainer,
                                a = i.endOffset,
                                s = i.commonAncestorContainer;
                            if (n = e, 3 === e.nodeType && (n = e.parentNode), i.collapsed) 3 === s.nodeType ? t = s.splitText(a) : (null !== n.lastChild && p.a.isBreak(n.lastChild) && n.removeChild(n.lastChild), t = null);
                            else if (e === l) {
                                t = this.isEdgePoint(l, a) ? l.nextSibling : l.splitText(a);
                                let i = e;
                                this.isEdgePoint(e, o) || (i = e.splitText(o)), n.removeChild(i)
                            } else
                                for (this.removeNode(), n = s, t = l; t.parentNode !== s;) t = t.parentNode
                        }
                        try {
                            n.insertBefore(e, t)
                        } catch (t) {
                            n.appendChild(e)
                        }
                    },
                    removeNode: function() {
                        const e = this.getRange();
                        if (e.deleteContents) return void e.deleteContents();
                        const t = e.startContainer,
                            i = e.startOffset,
                            n = e.endContainer,
                            o = e.endOffset,
                            l = e.commonAncestorContainer;
                        let a = null,
                            s = null;
                        const r = p.a.getListChildNodes(l);
                        let d = p.a.getArrayIndex(r, t),
                            c = p.a.getArrayIndex(r, n);
                        for (let e = d + 1, n = t; e >= 0; e--) r[e] === n.parentNode && r[e].firstChild === n && 0 === i && (d = e, n = n.parentNode);
                        for (let e = c - 1, t = n; e > d; e--) r[e] === t.parentNode && 1 === r[e].nodeType && (r.splice(e, 1), t = t.parentNode, --c);
                        for (let e = d; e <= c; e++) {
                            const l = r[e];
                            0 === l.length || 3 === l.nodeType && void 0 === l.data ? p.a.removeItem(l) : l !== t ? l !== n ? p.a.removeItem(l) : (s = 1 === n.nodeType ? p.a.createTextNode(n.textContent) : p.a.createTextNode(n.substringData(o, n.length - o))).length > 0 ? n.data = s.data : p.a.removeItem(n) : (a = 1 === t.nodeType ? p.a.createTextNode(t.textContent) : p.a.createTextNode(t.substringData(0, i))).length > 0 ? t.data = a.data : p.a.removeItem(t)
                        }
                    },
                    wrapToTags: function(e) {
                        const t = this.getRange(),
                            i = this.getSelectedFormatElements();
                        if (!i) {
                            const t = p.a.createElement(p.a.isCell(this.getSelectionNode()) ? "DIV" : "P");
                            return t.innerHTML = p.a.zeroWidthSpace, e.appendChild(t), void this.getSelectionNode().appendChild(e)
                        }
                        let n, o, l, a = i[i.length - 1];
                        n = p.a.isRangeFormatElement(a) || p.a.isFormatElement(a) ? a : p.a.getRangeFormatElement(a) || p.a.getFormatElement(a), p.a.isCell(n) ? (o = null, l = n) : (o = n.nextSibling, l = n.parentNode);
                        let s = null,
                            r = null,
                            d = "";
                        for (let t = 0, n = i.length; t < n; t++) r = i[t], /^LI$/i.test(r.nodeName) ? (null !== s && /^LI$/i.test(d) || (s = p.a.createElement(r.parentNode.nodeName)), s.appendChild(r), t !== n - 1 && /^LI$/i.test(i[t + 1].nodeName) || e.appendChild(s)) : e.appendChild(r), d = r.nodeName;
                        l.insertBefore(e, o), t.collapsed || !p.a.isRangeFormatElement(t.startContainer) && !p.a.isRangeFormatElement(t.endContainer) || p.a.removeEmptyNode(l)
                    },
                    nodeChange: function(t, i) {
                        const n = this.getRange(),
                            o = /removenode/i.test(t.nodeName);
                        let l, a, s, r;
                        if (n.startContainer === n.endContainer) {
                            let e = n.startContainer;
                            if (o) {
                                if (p.a.getFormatElement(e) === e.parentNode) return
                            } else {
                                let n = 0;
                                for (let o = 0; o < i.length; o++)
                                    for (; !p.a.isFormatElement(e) && !p.a.isWysiwygDiv(e);) 1 === e.nodeType && e.style[i[o]] === t.style[i[o]] && n++, e = e.parentNode;
                                if (n >= i.length) return
                            }
                        }
                        if (l = p.a.isWysiwygDiv(n.startContainer) ? e.element.wysiwyg.firstChild : n.startContainer, a = n.startOffset, 1 === l.nodeType && l.childNodes.length > 0) {
                            for (; l && !p.a.isBreak(l) && 1 === l.nodeType;) {
                                r = [];
                                for (let e = 0, t = (s = l.childNodes).length; e < t; e++) r.push(s[e]);
                                l = r[a] || l.nextElementSibling || l.nextSibling, a = 0
                            }
                            if (p.a.isBreak(l)) {
                                const e = p.a.createTextNode(p.a.zeroWidthSpace);
                                l.parentNode.insertBefore(e, l), l = e
                            }
                        }
                        const d = l,
                            c = a;
                        if (l = p.a.isWysiwygDiv(n.endContainer) ? e.element.wysiwyg.lastChild : n.endContainer, a = n.endOffset, 1 === l.nodeType && l.childNodes.length > 0) {
                            for (; l && !p.a.isBreak(l) && 1 === l.nodeType;) {
                                r = [];
                                for (let e = 0, t = (s = l.childNodes).length; e < t; e++) r.push(s[e]);
                                l = r[a - 1] || !/FIGURE/i.test(r[0].nodeName) ? r[0] : l.previousElementSibling || l.previousSibling || d
                            }
                            if (a = l.textContent.length, p.a.isBreak(l)) {
                                const e = p.a.createTextNode(p.a.zeroWidthSpace);
                                l.parentNode.insertBefore(e, l), l = e, a = 0
                            }
                        }
                        const _ = l,
                            u = a,
                            g = n.commonAncestorContainer,
                            m = t.nodeName;
                        this.setRange(d, c, _, u);
                        let h, f, b = {},
                            v = {};
                        if (i) {
                            f = "(?:;|^|\\s)(?:" + i[0];
                            for (let e = 1; e < i.length; e++) f += "|" + i[e];
                            f += ")\\s*:[^;]*\\s*(?:;|$)", f = new RegExp(f, "ig")
                        }
                        const y = function(e) {
                            if (o || 3 === e.nodeType || p.a.isBreak(e)) return !0;
                            let t = "";
                            return f && e.style.cssText.length > 0 && (t = e.style.cssText.replace(f, "").trim()), (t.length > 0 || e.nodeName !== m) && (e.style.cssText.length > 0 && (e.style.cssText = t), !0)
                        };
                        if (p.a.isWysiwygDiv(g) || p.a.isRangeFormatElement(g)) {
                            const e = this.getSelectedFormatElements(),
                                i = e.length - 1;
                            h = t.cloneNode(!1), b = this._nodeChange_startLine(e[0], h, y, d, c, o);
                            for (let n = 1; n < i; n++) h = t.cloneNode(!1), this._nodeChange_middleLine(e[n], h, y, o);
                            i > 0 ? (h = t.cloneNode(!1), v = this._nodeChange_endLine(e[i], h, y, _, u, o)) : v = b
                        } else {
                            h = t.cloneNode(!1);
                            const e = this._nodeChange_oneLine(p.a.getFormatElement(g), h, y, d, c, _, u, o, n.collapsed);
                            b.container = e.startContainer, b.offset = e.startOffset, v.container = e.endContainer, v.offset = e.endOffset
                        }
                        this.setRange(b.container, b.offset, v.container, v.offset)
                    },
                    _nodeChange_oneLine: function(e, t, i, n, o, l, a, s, r) {
                        const d = e,
                            c = e.cloneNode(!1),
                            _ = n === l;
                        let u, g, m, h, f = n,
                            b = o,
                            v = l,
                            y = a,
                            E = !1,
                            x = !1;

                        function C(e) {
                            const t = new RegExp("(?:;|^|\\s)(?:" + h + "null)\\s*:[^;]*\\s*(?:;|$)", "ig");
                            let i = "";
                            return t && e.style.cssText.length > 0 && (i = t.test(e.style.cssText)), !i
                        }
                        return function e(n, o) {
                            const l = n.childNodes;
                            for (let n = 0, a = l.length; n < a; n++) {
                                let a, k = l[n],
                                    w = o;
                                if (!E && k === f) {
                                    const e = p.a.createTextNode(1 === f.nodeType ? "" : f.substringData(0, b)),
                                        n = p.a.createTextNode(1 === f.nodeType ? "" : f.substringData(b, y > b ? y - b : b - y));
                                    for (e.data.length > 0 && o.appendChild(e), g = k, u = [], h = ""; g !== c && g !== d && null !== g;) i(g) && 1 === g.nodeType && C(g) && (u.push(g.cloneNode(!1)), h += g.style.cssText.substr(0, g.style.cssText.indexOf(":")) + "|"), g = g.parentNode;
                                    const l = u.pop() || n;
                                    for (m = g = l; u.length > 0;) g = u.pop(), m.appendChild(g), m = g;
                                    if (t.appendChild(l), c.appendChild(t), f = n, b = 0, E = !0, g !== n && g.appendChild(f), !_) continue
                                }
                                if (x || k !== v) {
                                    if (E) {
                                        if (1 === k.nodeType && !p.a.isBreak(k)) {
                                            e(k, k);
                                            continue
                                        }
                                        for (g = k, u = [], h = ""; null !== g.parentNode && g !== d && g !== t;) 1 === g.nodeType && !p.a.isBreak(k) && (x || i(g)) && C(g) && (u.push(g.cloneNode(!1)), h += g.style.cssText.substr(0, g.style.cssText.indexOf(":")) + "|"), g = g.parentNode;
                                        const n = u.pop() || k;
                                        for (m = g = n; u.length > 0;) g = u.pop(), m.appendChild(g), m = g;
                                        n === k ? o = x ? c : t : x ? (c.appendChild(n), o = g) : (t.appendChild(n), o = g)
                                    }
                                    a = k.cloneNode(!1), o.appendChild(a), 1 !== k.nodeType || p.a.isBreak(k) || (w = a), e(k, w)
                                } else {
                                    const e = p.a.createTextNode(1 === v.nodeType ? "" : v.substringData(y, v.length - y)),
                                        n = p.a.createTextNode(_ || 1 === v.nodeType ? "" : v.substringData(0, y));
                                    if (e.data.length > 0) {
                                        for (g = k, h = "", u = []; g !== c && g !== d && null !== g;) 1 === g.nodeType && C(g) && (u.push(g.cloneNode(!1)), h += g.style.cssText.substr(0, g.style.cssText.indexOf(":")) + "|"), g = g.parentNode;
                                        for (a = m = g = u.pop() || e; u.length > 0;) g = u.pop(), m.appendChild(g), m = g;
                                        c.appendChild(a), g.textContent = e.data
                                    }
                                    for (g = k, u = [], h = ""; g !== c && g !== d && null !== g;) i(g) && 1 === g.nodeType && C(g) && (u.push(g.cloneNode(!1)), h += g.style.cssText.substr(0, g.style.cssText.indexOf(":")) + "|"), g = g.parentNode;
                                    const o = u.pop() || n;
                                    for (m = g = o; u.length > 0;) g = u.pop(), m.appendChild(g), m = g;
                                    t.appendChild(o), v = n, y = n.data.length, x = !0, !s && r && (t = n, n.textContent = p.a.zeroWidthSpace), g !== n && g.appendChild(v)
                                }
                            }
                        }(e, c), s ? (f = p.a.createTextNode(r ? p.a.zeroWidthSpace : t.textContent), c.insertBefore(f, t), c.removeChild(t), r && (b = 1)) : r && (f = v = t, b = 1, y = 1), p.a.removeEmptyNode(c), e.parentNode.insertBefore(c, e), p.a.removeItem(e), {
                            startContainer: f,
                            startOffset: b,
                            endContainer: s || !v.textContent ? f : v,
                            endOffset: s || !v.textContent ? f.textContent.length : y
                        }
                    },
                    _nodeChange_middleLine: function(e, t, i, n) {
                        n ? t = p.a.createTextNode(e.textContent ? e.textContent : p.a.zeroWidthSpace) : function e(t, n) {
                            const o = t.childNodes;
                            for (let t = 0, l = o.length; t < l; t++) {
                                let l = o[t],
                                    a = n;
                                if (i(l)) {
                                    let e = l.cloneNode(!1);
                                    n.appendChild(e), 1 !== l.nodeType || p.a.isBreak(l) || (a = e)
                                }
                                e(l, a)
                            }
                        }(e, t), e.innerHTML = "", e.appendChild(t)
                    },
                    _nodeChange_startLine: function(e, t, i, n, o, l) {
                        const a = e,
                            s = e.cloneNode(!1);
                        let r, d, c, _ = n,
                            u = o,
                            g = !1;
                        return function e(n, o) {
                            const l = n.childNodes;
                            for (let n = 0, m = l.length; n < m; n++) {
                                const m = l[n];
                                let h = o;
                                if (g && !p.a.isBreak(m)) {
                                    if (1 === m.nodeType) {
                                        e(m, m);
                                        continue
                                    }
                                    for (d = m, r = []; null !== d.parentNode && d !== a && d !== t;) 1 === d.nodeType && i(d) && r.push(d.cloneNode(!1)), d = d.parentNode;
                                    if (r.length > 0) {
                                        const e = r.pop();
                                        for (c = d = e; r.length > 0;) d = r.pop(), c.appendChild(d), c = d;
                                        t.appendChild(e), o = d
                                    } else o = t
                                }
                                if (g || m !== _) {
                                    if (!g || i(m)) {
                                        const e = m.cloneNode(!1);
                                        o.appendChild(e), 1 !== m.nodeType || p.a.isBreak(m) || (h = e)
                                    }
                                    e(m, h)
                                } else {
                                    const e = p.a.createTextNode(1 === _.nodeType ? "" : _.substringData(0, u)),
                                        n = p.a.createTextNode(1 === _.nodeType ? "" : _.substringData(u, _.length - u));
                                    for (e.data.length > 0 && o.appendChild(e), d = o, r = []; d !== s && null !== d;) 1 === d.nodeType && i(d) && r.push(d.cloneNode(!1)), d = d.parentNode;
                                    const l = r.pop() || o;
                                    for (c = d = l; r.length > 0;) d = r.pop(), c.appendChild(d), c = d;
                                    l !== o ? (t.appendChild(l), o = d) : o = t, p.a.isBreak(m) && t.appendChild(m.cloneNode(!1)), s.appendChild(t), _ = n, u = 0, g = !0, o.appendChild(_)
                                }
                            }
                        }(e, s), l && (_ = p.a.createTextNode(t.textContent), s.insertBefore(_, t), s.removeChild(t)), l || 0 !== s.children.length ? (p.a.removeEmptyNode(s), e.parentNode.insertBefore(s, e), p.a.removeItem(e)) : e.childNodes ? _ = e.childNodes[0] : (_ = p.a.createTextNode(p.a.zeroWidthSpace), e.appendChild(_)), {
                            container: _,
                            offset: u
                        }
                    },
                    _nodeChange_endLine: function(e, t, i, n, o, l) {
                        const a = e,
                            s = e.cloneNode(!1);
                        let r, d, c, _ = n,
                            u = o,
                            g = !1;
                        return function e(n, o) {
                            const l = n.childNodes;
                            for (let n = l.length - 1; 0 <= n; n--) {
                                const m = l[n];
                                let h = o;
                                if (g && !p.a.isBreak(m)) {
                                    if (1 === m.nodeType) {
                                        e(m, m);
                                        continue
                                    }
                                    for (d = m, r = []; null !== d.parentNode && d !== a && d !== t;) i(d) && 1 === d.nodeType && r.push(d.cloneNode(!1)), d = d.parentNode;
                                    if (r.length > 0) {
                                        const e = r.pop();
                                        for (c = d = e; r.length > 0;) d = r.pop(), c.appendChild(d), c = d;
                                        t.insertBefore(e, t.firstChild), o = d
                                    } else o = t
                                }
                                if (g || m !== _) {
                                    if (!g || i(m)) {
                                        const e = m.cloneNode(!1);
                                        o.insertBefore(e, o.firstChild), 1 !== m.nodeType || p.a.isBreak(m) || (h = e)
                                    }
                                    e(m, h)
                                } else {
                                    const e = p.a.createTextNode(1 === _.nodeType ? "" : _.substringData(u, _.length - u)),
                                        n = p.a.createTextNode(1 === _.nodeType ? "" : _.substringData(0, u));
                                    for (e.data.length > 0 && o.insertBefore(e, o.firstChild), d = o, r = []; d !== s && null !== d;) i(d) && 1 === d.nodeType && r.push(d.cloneNode(!1)), d = d.parentNode;
                                    const l = r.pop() || o;
                                    for (c = d = l; r.length > 0;) d = r.pop(), c.appendChild(d), c = d;
                                    l !== o ? (t.insertBefore(l, t.firstChild), o = d) : o = t, p.a.isBreak(m) && t.appendChild(m.cloneNode(!1)), s.insertBefore(t, s.firstChild), _ = n, u = n.data.length, g = !0, o.insertBefore(_, o.firstChild)
                                }
                            }
                        }(e, s), l && (_ = p.a.createTextNode(t.textContent), u = _.textContent.length, s.insertBefore(_, t), s.removeChild(t)), l || 0 !== s.childNodes.length ? (p.a.removeEmptyNode(s), e.parentNode.insertBefore(s, e), p.a.removeItem(e)) : e.childNodes ? _ = e.childNodes[0] : (_ = p.a.createTextNode(p.a.zeroWidthSpace), e.appendChild(_)), {
                            container: _,
                            offset: u
                        }
                    },
                    commandHandler: function(t, i) {
                        switch (i) {
                            case "codeView":
                                this.controllersOff(), this.toggleCodeView(), p.a.toggleClass(t, "on");
                                break;
                            case "fullScreen":
                                this.controllersOff(), this.toggleFullScreen(t), p.a.toggleClass(t, "on");
                                break;
                            case "indent":
                            case "outdent":
                                this.indent(i);
                                break;
                            case "redo":
                            case "undo":
                                this.execCommand(i, !1, null);
                                break;
                            case "removeFormat":
                                this.removeFormat();
                                break;
                            case "preview":
                            case "print":
                                this.openWindowContents(i);
                                break;
                            case "showBlocks":
                                this.toggleDisplayBlocks(), p.a.toggleClass(t, "on");
                                break;
                            case "subscript":
                                p.a.hasClass(e.tool.superscript, "on") && (this.execCommand("superscript", !1, null), p.a.removeClass(e.tool.superscript, "on")), this.execCommand(i, !1, null), p.a.toggleClass(t, "on");
                                break;
                            case "superscript":
                                p.a.hasClass(e.tool.subscript, "on") && (this.execCommand("subscript", !1, null), p.a.removeClass(e.tool.subscript, "on")), this.execCommand(i, !1, null), p.a.toggleClass(t, "on");
                                break;
                            default:
                                this.execCommand(i, !1, t.getAttribute("data-value")), p.a.toggleClass(t, "on")
                        }
                        this.focus()
                    },
                    removeFormat: function() {
                        this.nodeChange(p.a.createElement("REMOVENODE"))
                    },
                    indent: function(e) {
                        const t = this.getSelectedFormatElements();
                        let i, n;
                        for (let o = 0, l = t.length; o < l; o++) i = t[o], n = /\d+/.test(i.style.marginLeft) ? 1 * i.style.marginLeft.match(/\d+/)[0] : 0, "indent" === e ? n += 25 : n -= 25, i.style.marginLeft = (n < 0 ? 0 : n) + "px"
                    },
                    toggleDisplayBlocks: function() {
                        p.a.toggleClass(e.element.wysiwyg, "sun-editor-show-block")
                    },
                    toggleCodeView: function() {
                        const t = this._variable.wysiwygActive,
                            i = this.codeViewDisabledButtons;
                        for (let e = 0, n = i.length; e < n; e++) i[e].disabled = t;
                        if (t) e.element.code.value = p.a.convertHTMLForCodeView(e.element.wysiwyg.innerHTML.trim()), e.element.wysiwyg.style.display = "none", e.element.code.style.display = "block", "auto" === e.option.height && (e.element.code.style.height = e.element.code.scrollHeight > 0 ? e.element.code.scrollHeight + "px" : "auto"), this._variable.wysiwygActive = !1, e.element.code.focus();
                        else {
                            const t = e.element.code.value.trim();
                            e.element.wysiwyg.innerHTML = t.length > 0 ? p.a.convertContentsForEditor(t) : "<p>" + p.a.zeroWidthSpace + "</p>", e.element.wysiwyg.scrollTop = 0, e.element.code.style.display = "none", e.element.wysiwyg.style.display = "block", "auto" === e.option.height && (e.element.code.style.height = "0px"), this._variable.wysiwygActive = !0, this.focus()
                        }
                    },
                    toggleFullScreen: function(t) {
                        this._variable.isFullScreen ? (this._variable.isFullScreen = !1, e.element.code.style.cssText = this._variable._codeOriginCssText, e.element.wysiwyg.style.cssText = this._variable._wysiwygOriginCssText, e.element.toolbar.style.cssText = "", e.element.editorArea.style.cssText = this._variable._editorAreaOriginCssText, e.element.topArea.style.cssText = this._variable._originCssText, n.body.style.overflow = this._variable._bodyOverflow, e.option.stickyToolbar > -1 && (p.a.removeClass(e.element.toolbar, "sun-editor-sticky"), a.onScroll_window()), p.a.removeClass(t.firstElementChild, "icon-reduction"), p.a.addClass(t.firstElementChild, "icon-expansion")) : (this._variable.isFullScreen = !0, e.element.topArea.style.position = "fixed", e.element.topArea.style.top = "0", e.element.topArea.style.left = "0", e.element.topArea.style.width = "100%", e.element.topArea.style.height = "100%", e.element.topArea.style.zIndex = "2147483647", this._variable._bodyOverflow = n.body.style.overflow, n.body.style.overflow = "hidden", this._variable._editorAreaOriginCssText = e.element.editorArea.style.cssText, this._variable._wysiwygOriginCssText = e.element.wysiwyg.style.cssText, this._variable._codeOriginCssText = e.element.code.style.cssText, e.element.editorArea.style.cssText = e.element.toolbar.style.cssText = e.element.wysiwyg.style.cssText = e.element.code.style.cssText = "", e.element.toolbar.style.width = e.element.wysiwyg.style.height = e.element.code.style.height = "100%", e.element.toolbar.style.position = "relative", this._variable.innerHeight_fullScreen = o.innerHeight - e.element.toolbar.offsetHeight, e.element.editorArea.style.height = this._variable.innerHeight_fullScreen + "px", p.a.removeClass(t.firstElementChild, "icon-expansion"), p.a.addClass(t.firstElementChild, "icon-reduction"))
                    },
                    openWindowContents: function(t) {
                        const n = "print" === t,
                            l = o.open("", "_blank");
                        l.mimeType = "text/html", l.document.write('<!doctype html><html><head><meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1"><title>' + (n ? i.toolbar.print : i.toolbar.preview) + '</title><link rel="stylesheet" type="text/css" href="' + p.a.getIncludePath(["suneditor-contents", "suneditor"], "css") + '"></head><body><div class="sun-editor-editable" style="width:' + e.element.wysiwyg.offsetWidth + 'px; margin:auto;">' + this.getContents() + "</div>" + (n ? "<script>_w.print();<\/script>" : "") + "</body></html>")
                    },
                    getContents: function() {
                        let t = "";
                        if (0 === e.element.wysiwyg.innerText.trim().length) return t;
                        t = l._variable.wysiwygActive ? e.element.wysiwyg.innerHTML : p.a.convertContentsForEditor(e.element.code.value);
                        const i = p.a.createElement("DIV");
                        i.innerHTML = t;
                        const n = p.a.getListChildren(i, function(e) {
                            return /FIGCAPTION/i.test(e.nodeName)
                        });
                        for (let e = 0, t = n.length; e < t; e++) n[e].outerHTML = n[e].outerHTML.replace(/(?!^<figcaption\s+)(contenteditable="([a-z]+|\s*)")\s*(?=[^>]*>)/i, "");
                        return i.innerHTML
                    }
                },
                a = {
                    _shortcutKeyCode: {
                        66: ["bold", "B"],
                        83: ["strikethrough", "STRIKE"],
                        85: ["underline", "U"],
                        73: ["italic", "I"],
                        89: ["redo"],
                        90: ["undo"],
                        219: ["outdent"],
                        221: ["indent"]
                    },
                    _directionKeyKeyCode: new RegExp("^(?:8|13|32|46|33|34|35|36|37|38|39|40|98|100|102|104)$"),
                    _changeButtonClassTagCheck: new RegExp("^(?:B|U|I|STRIKE|SUB|SUP)$"),
                    _findButtonEffectTag: function() {
                        const t = l.commandMap,
                            n = this._changeButtonClassTagCheck,
                            o = [],
                            a = [];
                        let s = !0,
                            r = !0,
                            d = !0,
                            c = !0,
                            _ = !0,
                            u = !0,
                            g = !0,
                            m = !0,
                            h = "",
                            f = "";
                        for (let n = l.getSelectionNode(); !p.a.isWysiwygDiv(n) && n; n = n.parentNode)
                            if (1 === n.nodeType)
                                if (f = n.nodeName.toUpperCase(), a.push(f), s && p.a.isFormatElement(n)) o.push("FORMAT"), p.a.changeTxt(t.FORMAT, f), s = !1;
                                else {
                                    if (r && (n.style.fontFamily.length > 0 || n.face && n.face.length > 0)) {
                                        o.push("FONT");
                                        const e = (n.style.fontFamily || n.face || i.toolbar.font).replace(/["']/g, "");
                                        p.a.changeTxt(t.FONT, e), r = !1
                                    }
                                    c && /^A$/.test(f) && null === n.getAttribute("data-image-link") ? (e.link && l.controllerArray[0] === e.link.linkBtn || l.callPlugin("link", function() {
                                        l.plugins.link.call_controller_linkButton.call(l, n)
                                    }), c = !1) : c && e.link && l.controllerArray[0] === e.link.linkBtn && l.controllersOff(), d && /^SPAN$/.test(f) && n.style.fontSize.length > 0 && (o.push("SIZE"), p.a.changeTxt(t.SIZE, n.style.fontSize), d = !1), h = n.style.cssText, _ && /font\-weight\s*:\s*(?:\d+|bold|bolder)(?:;|\s|)/.test(h) && (o.push("B"), _ = !1), u && /font\-style\s*:\s*(?:italic|oblique)(?:;|\s)/.test(h) && (o.push("I"), u = !1), g && /text\-decoration(?:\-line)?\s*:\s*underline(?:;|\s|)/.test(h) && (o.push("U"), g = !1), m && /text\-decoration(?:\-line)?\s*:\s*line-through(?:;|\s|)/.test(h) && (o.push("STRIKE"), m = !1), o.push(/^STRONG$/.test(f) ? "B" : /^EM$/.test(f) ? "I" : f)
                                } c && l.controllersOff();
                        for (let e = 0; e < o.length; e++) f = o[e], n.test(f) && p.a.addClass(t[f], "on");
                        for (let e in t) o.indexOf(e) > -1 || (/^FONT/i.test(e) ? p.a.changeTxt(t[e], i.toolbar.font) : /^SIZE$/i.test(e) ? p.a.changeTxt(t[e], i.toolbar.fontSize) : p.a.removeClass(t[e], "on"));
                        l._variable.currentNodes = a.reverse(), e.option.showPathLabel && (e.element.navigation.textContent = l._variable.currentNodes.join(" > "))
                    },
                    _cancelCaptionEdit: function() {
                        this.setAttribute("contenteditable", !1), this.removeEventListener("blur", a._cancelCaptionEdit)
                    },
                    onMouseDown_toolbar: function(e) {
                        l._editorRange(), e.preventDefault();
                        let t = e.target;
                        if (p.a.getParentElement(t, ".sun-editor-submenu")) e.stopPropagation();
                        else {
                            let i = t.getAttribute("data-command"),
                                n = t.className;
                            for (; !i && !/editor_tool/.test(n) && !/sun-editor-id-toolbar/.test(n);) i = (t = t.parentNode).getAttribute("data-command"), n = t.className;
                            i === l._submenuName && e.stopPropagation()
                        }
                    },
                    onClick_toolbar: function(e) {
                        e.preventDefault(), e.stopPropagation();
                        let t = e.target,
                            i = t.getAttribute("data-display"),
                            n = t.getAttribute("data-command"),
                            o = t.className;
                        for (; !n && !/editor_tool/.test(o) && !/sun-editor-id-toolbar/.test(o);) t = t.parentNode, n = t.getAttribute("data-command"), i = t.getAttribute("data-display"), o = t.className;
                        if ((n || i) && !t.disabled) return i ? !/submenu/.test(i) || null !== t.nextElementSibling && t === l.submenuActiveButton ? /dialog/.test(i) ? void l.callPlugin(n, function() {
                            l.plugins.dialog.open.call(l, n, !1)
                        }) : void l.submenuOff() : void l.callPlugin(n, function() {
                            l.submenuOn(t)
                        }) : void(n && (l.focus(), l.commandHandler(t, n)))
                    },
                    onMouseUp_wysiwyg: function() {
                        if (l._editorRange(), l._isBalloon) {
                            const e = l.getRange();
                            e.collapsed ? a._hideToolbar() : a._showToolbarBalloon(e)
                        }
                    },
                    onClick_wysiwyg: function(e) {
                        e.stopPropagation();
                        const t = e.target;
                        if (/^IMG$/i.test(t.nodeName)) return e.preventDefault(), void l.callPlugin("image", function() {
                            const e = l.plugins.resizing.call_controller_resize.call(l, t, "image");
                            l.plugins.image.onModifyMode.call(l, t, e), p.a.getParentElement(t, ".sun-editor-id-image-container") || (l.plugins.image.openModify.call(l, !0), l.plugins.image.update_image.call(l), l.controllersOff())
                        });
                        if (/sun-editor-id-iframe-inner-resizing-cover/i.test(t.className)) return e.preventDefault(), void l.callPlugin("video", function() {
                            const e = p.a.getChildElement(t.parentNode, "iframe"),
                                i = l.plugins.resizing.call_controller_resize.call(l, e, "video");
                            l.plugins.video.onModifyMode.call(l, e, i)
                        });
                        a._findButtonEffectTag();
                        const i = p.a.getParentElement(t, "FIGCAPTION");
                        if (i && "ture" !== i.getAttribute("contenteditable")) {
                            if (e.preventDefault(), i.setAttribute("contenteditable", !0), i.focus(), l._isInline && !l._inlineToolbarAttr.isShow) {
                                a._showToolbarInline();
                                const e = function() {
                                    a._hideToolbar(), n.removeEventListener("click", e)
                                };
                                n.addEventListener("click", e)
                            }
                        } else {
                            const e = p.a.getParentElement(t, p.a.isCell);
                            e && 0 === l.controllerArray.length && l.callPlugin("table", l.plugins.table.call_controller_tableEdit.bind(l, e))
                        }
                        s.onClick && s.onClick(e)
                    },
                    _showToolbarBalloon: function(t) {
                        const i = t || l.getRange(),
                            a = e.element.toolbar,
                            s = o.getSelection();
                        let r;
                        if (s.focusNode === s.anchorNode) r = s.focusOffset < s.anchorOffset;
                        else {
                            const e = p.a.getListChildNodes(i.commonAncestorContainer);
                            r = p.a.getArrayIndex(e, s.focusNode) < p.a.getArrayIndex(e, s.anchorNode)
                        }
                        let d = i.getClientRects();
                        d = d[r ? 0 : d.length - 1], a.style.display = "block";
                        const c = a.offsetWidth,
                            _ = a.offsetHeight;
                        let u = (r ? d.left : d.right) - e.element.topArea.offsetLeft + (o.scrollX || n.documentElement.scrollLeft) - c / 2,
                            g = (r ? d.top - _ - 11 : d.bottom + 11) - e.element.topArea.offsetTop + (o.scrollY || n.documentElement.scrollTop);
                        const m = u + c - e.element.topArea.offsetWidth;
                        a.style.left = (u < 0 ? 20 : m < 0 ? u : u - m - 20) + "px", a.style.top = g + "px", r ? (p.a.removeClass(e.element._arrow, "arrow-up"), p.a.addClass(e.element._arrow, "arrow-down"), e.element._arrow.style.top = _ + "px") : (p.a.removeClass(e.element._arrow, "arrow-down"), p.a.addClass(e.element._arrow, "arrow-up"), e.element._arrow.style.top = "-11px");
                        const h = e.element._arrow.offsetWidth,
                            f = c / 2 + (u < 0 ? u - h : m < 0 ? 0 : m + h),
                            b = h / 2;
                        e.element._arrow.style.left = (f < b ? b : f + b >= c ? f - b : f) + "px"
                    },
                    _showToolbarInline: function() {
                        const t = e.element.toolbar;
                        t.style.display = "block", l._inlineToolbarAttr.width = t.style.width = e.option.toolbarWidth, l._inlineToolbarAttr.top = t.style.top = -1 - t.offsetHeight + "px", a.onScroll_window(), l._inlineToolbarAttr.isShow = !0
                    },
                    _hideToolbar: function() {
                        e.element.toolbar.style.display = "none", l._inlineToolbarAttr.isShow = !1
                    },
                    onKeyDown_wysiwyg: function(e) {
                        const t = e.keyCode,
                            i = e.shiftKey,
                            n = e.ctrlKey || e.metaKey,
                            o = e.altKey;
                        if (l._isBalloon && a._hideToolbar(), n && !/^(?:16|17|18)$/.test(t) && (i || 83 !== t) && function(e) {
                                const t = a._shortcutKeyCode[e];
                                return !!t && (l.commandHandler(p.a.getFormatElement(l.getSelectionNode()), t[0]), p.a.toggleClass(l.commandMap[t[1]], "on"), !0)
                            }(t)) return void e.preventDefault();
                        const r = l.getSelectionNode();
                        switch (t) {
                            case 8:
                                if (p.a.isFormatElement(r) && p.a.isWysiwygDiv(r.parentNode) && null === r.previousSibling) return e.preventDefault(), e.stopPropagation(), r.innerHTML = p.a.zeroWidthSpace, !1;
                                break;
                            case 9:
                                if (e.preventDefault(), n || o) break;
                                l.controllersOff();
                                let a = r || l.getSelectionNode();
                                for (; !p.a.isCell(a) && !p.a.isWysiwygDiv(a);) a = a.parentNode;
                                if (a && p.a.isCell(a)) {
                                    const e = p.a.getParentElement(a, "table"),
                                        t = p.a.getListChildren(e, p.a.isCell);
                                    let n = i ? p.a.prevIdx(t, a) : p.a.nextIdx(t, a);
                                    n !== t.length || i || (n = 0), -1 === n && i && (n = t.length - 1);
                                    const o = t[n];
                                    if (!o) return !1;
                                    l.setRange(o, 0, o, 0);
                                    break
                                }
                                const s = l.getSelectedFormatElements();
                                if (i)
                                    for (let e, t = 0, i = s.length; t < i; t++) e = s[t].firstChild, /^\s{1,4}$/.test(e.textContent) ? p.a.removeItem(e) : /^\s{1,4}/.test(e.textContent) && (e.textContent = e.textContent.replace(/^\s{1,4}/, ""));
                                else {
                                    const e = p.a.createTextNode(new Array(l._variable.tabSize + 1).join(" "));
                                    if (1 === s.length) l.insertNode(e), l.setRange(e, l._variable.tabSize, e, l._variable.tabSize);
                                    else
                                        for (let t = 0, i = s.length; t < i; t++) s[t].insertBefore(e.cloneNode(!1), s[t].firstChild)
                                }
                        }
                        s.onKeyDown && s.onKeyDown(e)
                    },
                    onKeyUp_wysiwyg: function(t) {
                        l._editorRange(), l.controllersOff();
                        const i = l.getSelectionNode();
                        if (!l._isBalloon || l.getRange().collapsed) {
                            if (8 === t.keyCode && p.a.isWysiwygDiv(i) && 0 === e.element.wysiwyg.textContent.length) {
                                t.preventDefault(), t.stopPropagation();
                                const e = p.a.createElement(p.a.isFormatElement(l._variable.currentNodes[0]) ? l._variable.currentNodes[0] : "P");
                                return e.innerHTML = p.a.zeroWidthSpace, i.appendChild(e), void l.setRange(e, 0, e, 0)
                            }
                            if ((p.a.isWysiwygDiv(i.parentElement) || p.a.isRangeFormatElement(i.parentElement)) && 3 === i.nodeType) return l.execCommand("formatBlock", !1, p.a.isWysiwygDiv(i.parentElement) ? "P" : "DIV"), void a._findButtonEffectTag();
                            a._directionKeyKeyCode.test(t.keyCode) && a._findButtonEffectTag(), s.onKeyUp && s.onKeyUp(t)
                        } else a._showToolbarBalloon()
                    },
                    onScroll_wysiwyg: function(e) {
                        l.controllersOff(), s.onScroll && s.onScroll(e)
                    },
                    onDrop_wysiwyg: function(t) {
                        const i = t.dataTransfer.files;
                        i.length > 0 && (t.stopPropagation(), t.preventDefault(), l.focus(), l.callPlugin("image", function() {
                            e.image.imgInputFile.files = i, l.plugins.image.onRender_imgInput.call(l), e.image.imgInputFile.files = null
                        })), s.onDrop && s.onDrop(t)
                    },
                    onMouseDown_resizingBar: function(t) {
                        t.stopPropagation(), l._variable.resizeClientY = t.clientY, e.element.resizeBackground.style.display = "block", n.addEventListener("mousemove", a._resize_editor), n.addEventListener("mouseup", function t() {
                            e.element.resizeBackground.style.display = "none", n.removeEventListener("mousemove", a._resize_editor), n.removeEventListener("mouseup", t)
                        })
                    },
                    _resize_editor: function(t) {
                        const i = e.element.editorArea.offsetHeight + (t.clientY - l._variable.resizeClientY);
                        e.element.wysiwyg.style.height = e.element.code.style.height = (i < l._variable.minResizingSize ? l._variable.minResizingSize : i) + "px", l._variable.resizeClientY = t.clientY
                    },
                    onResize_window: function() {
                        0 !== e.element.toolbar.offsetWidth && (l._variable.isFullScreen ? (l._variable.innerHeight_fullScreen += o.innerHeight - e.element.toolbar.offsetHeight - l._variable.innerHeight_fullScreen, e.element.editorArea.style.height = l._variable.innerHeight_fullScreen + "px") : l._variable._sticky && (e.element.toolbar.style.width = e.element.topArea.offsetWidth - 2 + "px", a.onScroll_window()), l.controllersOff())
                    },
                    onScroll_window: function() {
                        if (l._variable.isFullScreen || 0 === e.element.toolbar.offsetWidth) return;
                        const t = e.element,
                            i = t.editorArea.offsetHeight,
                            o = t.topArea.offsetTop - (l._isInline ? t.toolbar.offsetHeight : 0),
                            s = (this.scrollY || n.documentElement.scrollTop) + e.option.stickyToolbar;
                        s < o ? a._offStickyToolbar(t) : s + l._variable.minResizingSize >= i + o ? (l._variable._sticky || a._onStickyToolbar(t), t.toolbar.style.top = i + o + e.option.stickyToolbar - s - l._variable.minResizingSize + "px") : s >= o && a._onStickyToolbar(t)
                    },
                    _onStickyToolbar: function(t) {
                        l._isInline || (t._stickyDummy.style.height = t.toolbar.offsetHeight + "px", t._stickyDummy.style.display = "block"), t.toolbar.style.top = e.option.stickyToolbar + "px", t.toolbar.style.width = l._isInline ? l._inlineToolbarAttr.width : t.toolbar.offsetWidth + "px", p.a.addClass(t.toolbar, "sun-editor-sticky"), l._variable._sticky = !0
                    },
                    _offStickyToolbar: function(e) {
                        e._stickyDummy.style.display = "none", e.toolbar.style.top = l._isInline ? l._inlineToolbarAttr.top : "", e.toolbar.style.width = l._isInline ? l._inlineToolbarAttr.width : "", e.editorArea.style.marginTop = "", p.a.removeClass(e.toolbar, "sun-editor-sticky"), l._variable._sticky = !1
                    },
                    _codeViewAutoScroll: function() {
                        e.element.code.style.height = e.element.code.scrollHeight + "px"
                    },
                    onPaste_wysiwyg: function(e) {
                        if (!e.clipboardData.getData) return !0;
                        const t = p.a.cleanHTML(e.clipboardData.getData("text/html"));
                        t && (l.execCommand("insertHTML", !1, t), e.stopPropagation(), e.preventDefault())
                    }
                };
            e.element.toolbar.addEventListener("mousedown", a.onMouseDown_toolbar, !1), e.element.toolbar.addEventListener("click", a.onClick_toolbar, !1), e.element.relative.addEventListener("click", l.focus.bind(l), !1), e.element.wysiwyg.addEventListener("mouseup", a.onMouseUp_wysiwyg, !1), e.element.wysiwyg.addEventListener("click", a.onClick_wysiwyg, !1), e.element.wysiwyg.addEventListener("scroll", a.onScroll_wysiwyg, !1), e.element.wysiwyg.addEventListener("keydown", a.onKeyDown_wysiwyg, !1), e.element.wysiwyg.addEventListener("keyup", a.onKeyUp_wysiwyg, !1), e.element.wysiwyg.addEventListener("drop", a.onDrop_wysiwyg, !1), e.element.wysiwyg.addEventListener("paste", a.onPaste_wysiwyg, !1), "auto" === e.option.height && e.element.code.addEventListener("keyup", a._codeViewAutoScroll, !1), e.element.resizingBar && (/\d+/.test(e.option.height) ? e.element.resizingBar.addEventListener("mousedown", a.onMouseDown_resizingBar, !1) : p.a.addClass(e.element.resizingBar, "none-resize")), l._isInline && e.element.wysiwyg.addEventListener("focus", a._showToolbarInline, !1), (l._isInline || l._isBalloon) && e.element.wysiwyg.addEventListener("blur", a._hideToolbar, !1), o.addEventListener("resize", a.onResize_window, !1), e.option.stickyToolbar > -1 && o.addEventListener("scroll", a.onScroll_window, !1), t && Object.keys(t).map(function(e) {
                let i = t[e];
                l.plugins[i.name] = p.a.copyObj(i)
            });
            const s = {
                onScroll: null,
                onClick: null,
                onKeyDown: null,
                onKeyUp: null,
                onDrop: null,
                onImageUpload: null,
                noticeOpen: function(e) {
                    l.addModule([f.a]), f.a.open.call(l, e)
                },
                noticeClose: function() {
                    l.addModule([f.a]), f.a.close.call(l)
                },
                save: function() {
                    e.element.originElement.value = l.getContents()
                },
                getContext: function() {
                    return e
                },
                getContents: function() {
                    return l.getContents()
                },
                getImagesInfo: function() {
                    return l._variable._imagesInfo
                },
                insertHTML: function(e) {
                    if (!e.nodeType || 1 !== e.nodeType) {
                        const t = p.a.createElement("template");
                        t.innerHTML = e, e = t.firstChild || t.content.firstChild
                    }
                    l.insertNode(e), l.focus()
                },
                setContents: function(t) {
                    l._variable.wysiwygActive ? e.element.wysiwyg.innerHTML = p.a.convertContentsForEditor(t) : e.element.code.value = t
                },
                appendContents: function(t) {
                    l._variable.wysiwygActive ? e.element.wysiwyg.innerHTML += p.a.convertContentsForEditor(t) : e.element.code.value += t
                },
                disabled: function() {
                    e.tool.cover.style.display = "block", e.element.wysiwyg.setAttribute("contenteditable", !1), e.element.code.setAttribute("disabled", "disabled")
                },
                enabled: function() {
                    e.tool.cover.style.display = "none", e.element.wysiwyg.setAttribute("contenteditable", !0), e.element.code.removeAttribute("disabled")
                },
                show: function() {
                    const t = e.element.topArea.style;
                    "none" === t.display && (t.display = e.option.display)
                },
                hide: function() {
                    e.element.topArea.style.display = "none"
                },
                destroy: function() {
                    o.removeEventListener("resize", a.onResize_window), o.removeEventListener("scroll", a.onScroll_window), p.a.removeItem(e.element.topArea), this.onScroll = null, this.onClick = null, this.onKeyDown = null, this.onKeyUp = null, this.onDrop = null, this.save = null, this.onImageUpload = null, this.noticeOpen = null, this.noticeClose = null, this.getContext = null, this.getContents = null, this.getImagesInfo = null, this.insertHTML = null, this.setContents = null, this.appendContents = null, this.disabled = null, this.enabled = null, this.show = null, this.hide = null, this.destroy = null, e = null, t = null, i = null
                }
            };
            return s
        };
        var v = {
            init: function(e, t, i, n) {
                "object" != typeof t && (t = {}), t.lang = i, t.mode = t.mode || "classic", t.toolbarWidth = t.toolbarWidth ? /^\d+$/.test(t.toolbarWidth) ? t.toolbarWidth + "px" : t.toolbarWidth : "max-content", t.stickyToolbar = /balloon/i.test(t.mode) ? -1 : void 0 === t.stickyToolbar ? 0 : /\d+/.test(t.stickyToolbar) ? 1 * t.stickyToolbar.toString().match(/\d+/)[0] : -1, t.resizingBar = !/inline|balloon/i.test(t.mode) && (void 0 === t.resizingBar || t.resizingBar), t.showPathLabel = "boolean" != typeof t.showPathLabel || t.showPathLabel, t.popupDisplay = t.popupDisplay || "full", t.display = t.display || ("none" !== e.style.display && e.style.display ? e.style.display : "block"), t.width = t.width ? /^\d+$/.test(t.width) ? t.width + "px" : t.width : e.clientWidth ? e.clientWidth + "px" : "100%", t.height = t.height ? /^\d+$/.test(t.height) ? t.height + "px" : t.height : e.clientHeight ? e.clientHeight + "px" : "auto", t.minHeight = (/^\d+$/.test(t.minHeight) ? t.height + "px" : t.minHeight) || "", t.maxHeight = (/^\d+$/.test(t.maxHeight) ? t.maxHeight + "px" : t.maxHeight) || "", t.font = t.font || null, t.fontSize = t.fontSize || null, t.colorList = t.colorList || null, t.imageResizing = void 0 === t.imageResizing || t.imageResizing, t.imageWidth = t.imageWidth || "auto", t.imageFileInput = void 0 === t.imageFileInput || t.imageFileInput, t.imageUrlInput = void 0 === t.imageUrlInput || !t.imageFileInput || t.imageUrlInput, t.imageUploadUrl = t.imageUploadUrl || null, t.videoResizing = void 0 === t.videoResizing || t.videoResizing, t.videoWidth = t.videoWidth || 560, t.videoHeight = t.videoHeight || 315, t.buttonList = t.buttonList || [
                    ["undo", "redo"],
                    ["bold", "underline", "italic", "strike", "subscript", "superscript"],
                    ["removeFormat"],
                    ["indent", "outdent"],
                    ["fullScreen", "showBlocks", "codeView"],
                    ["preview", "print"]
                ];
                const o = document,
                    l = o.createElement("DIV");
                l.className = "sun-editor", e.id && (l.id = "suneditor_" + e.id), l.style.width = t.width, l.style.display = t.display;
                const a = o.createElement("DIV");
                a.className = "sun-editor-container";
                const s = this._createToolBar(o, t.buttonList, n, i);
                let r = null;
                /inline|balloon/i.test(t.mode) && (s.element.className += " sun-inline-toolbar", s.element.style.width = t.toolbarWidth, /balloon/i.test(t.mode) && ((r = o.createElement("DIV")).className = "arrow", s.element.appendChild(r)));
                const d = o.createElement("DIV");
                d.className = "sun-editor-sticky-dummy";
                const c = o.createElement("DIV");
                c.className = "sun-editor-id-editorArea";
                const _ = o.createElement("DIV");
                _.setAttribute("contenteditable", !0), _.setAttribute("scrolling", "auto"), _.className = "input_editor sun-editor-id-wysiwyg sun-editor-editable", _.style.display = "block", _.innerHTML = p.a.convertContentsForEditor(e.value), _.style.height = t.height, _.style.minHeight = t.minHeight, _.style.maxHeight = t.maxHeight;
                const u = o.createElement("TEXTAREA");
                u.className = "input_editor sun-editor-id-code", u.style.display = "none", u.style.height = t.height, u.style.minHeight = t.minHeight, u.style.maxHeight = t.maxHeight;
                let g = null;
                t.resizingBar && ((g = o.createElement("DIV")).className = "sun-editor-id-resizingBar sun-editor-common");
                const m = o.createElement("SPAN");
                m.className = "sun-editor-id-navigation sun-editor-common";
                const h = o.createElement("DIV");
                h.className = "sun-editor-id-loading sun-editor-common", h.innerHTML = '<div class="loading-effect"></div>';
                const f = o.createElement("DIV");
                return f.className = "sun-editor-id-resize-background", c.appendChild(_), c.appendChild(u), a.appendChild(s.element), a.appendChild(d), a.appendChild(c), a.appendChild(f), a.appendChild(h), g && (g.appendChild(m), a.appendChild(g)), l.appendChild(a), {
                    constructed: {
                        _top: l,
                        _relative: a,
                        _toolBar: s.element,
                        _editorArea: c,
                        _wysiwygArea: _,
                        _codeArea: u,
                        _resizingBar: g,
                        _navigation: m,
                        _loading: h,
                        _resizeBack: f,
                        _stickyDummy: d,
                        _arrow: r
                    },
                    options: t,
                    plugins: s.plugins
                }
            },
            _defaultButtons: function(e) {
                return {
                    bold: ["sun-editor-id-bold", e.toolbar.bold + "(Ctrl+B)", "bold", "", '<div class="icon-bold"></div>'],
                    underline: ["sun-editor-id-underline", e.toolbar.underline + "(Ctrl+U)", "underline", "", '<div class="icon-underline"></div>'],
                    italic: ["sun-editor-id-italic", e.toolbar.italic + "(Ctrl+I)", "italic", "", '<div class="icon-italic"></div>'],
                    strike: ["sun-editor-id-strike", e.toolbar.strike + "(Ctrl+SHIFT+S)", "strikethrough", "", '<div class="icon-strokethrough"></div>'],
                    subscript: ["sun-editor-id-subscript", e.toolbar.subscript, "subscript", "", '<div class="icon-subscript"></div>'],
                    superscript: ["sun-editor-id-superscript", e.toolbar.superscript, "superscript", "", '<div class="icon-superscript"></div>'],
                    removeFormat: ["", e.toolbar.removeFormat, "removeFormat", "", '<div class="icon-erase"></div>'],
                    indent: ["", e.toolbar.indent + "(Ctrl + ])", "indent", "", '<div class="icon-indent-right"></div>'],
                    outdent: ["", e.toolbar.outdent + "(Ctrl + [)", "outdent", "", '<div class="icon-indent-left"></div>'],
                    fullScreen: ["code-view-enabled", e.toolbar.fullScreen, "fullScreen", "", '<div class="icon-expansion"></div>'],
                    showBlocks: ["", e.toolbar.showBlocks, "showBlocks", "", '<div class="icon-showBlocks"></div>'],
                    codeView: ["code-view-enabled", e.toolbar.codeView, "codeView", "", '<div class="icon-code-view"></div>'],
                    undo: ["code-view-enabled", e.toolbar.undo + " (Ctrl+Z)", "undo", "", '<div class="icon-undo"></div>'],
                    redo: ["code-view-enabled", e.toolbar.redo + " (Ctrl+Y)", "redo", "", '<div class="icon-redo"></div>'],
                    preview: ["", e.toolbar.preview, "preview", "", '<div class="icon-preview"></div>'],
                    print: ["", e.toolbar.print, "print", "", '<div class="icon-print"></div>'],
                    font: ["btn_font", e.toolbar.font, "font", "submenu", '<span class="txt sun-editor-font-family">' + e.toolbar.font + '</span><span class="icon-arrow-down"></span>'],
                    formatBlock: ["btn_format", e.toolbar.formats, "formatBlock", "submenu", '<span class="txt sun-editor-font-format">' + e.toolbar.formats + '</span><span class="icon-arrow-down"></span>'],
                    fontSize: ["btn_size", e.toolbar.fontSize, "fontSize", "submenu", '<span class="txt sun-editor-font-size">' + e.toolbar.fontSize + '</span><span class="icon-arrow-down"></span>'],
                    fontColor: ["", e.toolbar.fontColor, "fontColor", "submenu", '<div class="icon-fontColor"></div>'],
                    hiliteColor: ["", e.toolbar.hiliteColor, "hiliteColor", "submenu", '<div class="icon-hiliteColor"></div>'],
                    align: ["btn_align", e.toolbar.align, "align", "submenu", '<div class="icon-align-left"></div>'],
                    list: ["", e.toolbar.list, "list", "submenu", '<div class="icon-list-number"></div>'],
                    horizontalRule: ["btn_line", e.toolbar.horizontalRule, "horizontalRule", "submenu", '<div class="icon-hr"></div>'],
                    table: ["", e.toolbar.table, "table", "submenu", '<div class="icon-grid"></div>'],
                    link: ["", e.toolbar.link, "link", "dialog", '<div class="icon-link"></div>'],
                    image: ["", e.toolbar.image, "image", "dialog", '<div class="icon-image"></div>'],
                    video: ["", e.toolbar.video, "video", "dialog", '<div class="icon-video"></div>']
                }
            },
            _createModuleGroup: function(e) {
                const t = p.a.createElement("DIV");
                t.className = "tool_module" + (e ? "" : " sun-editor-module-border");
                const i = p.a.createElement("UL");
                return i.className = "editor_tool", t.appendChild(i), {
                    div: t,
                    ul: i
                }
            },
            _createButton: function(e, t, i, n, o) {
                const l = p.a.createElement("LI"),
                    a = p.a.createElement("BUTTON");
                return a.setAttribute("type", "button"), a.setAttribute("class", "btn_editor " + e), a.setAttribute("title", t), a.setAttribute("data-command", i), a.setAttribute("data-display", n), a.innerHTML = o, l.appendChild(a), {
                    li: l,
                    button: a
                }
            },
            _createToolBar: function(e, t, i, n) {
                const o = e.createElement("DIV");
                o.className = "sun-editor-toolbar-separator-vertical";
                const l = e.createElement("DIV");
                l.className = "sun-editor-id-toolbar sun-editor-common";
                const a = this._defaultButtons(n),
                    s = {};
                if (i) {
                    const e = i.length ? i : Object.keys(i).map(function(e) {
                        return i[e]
                    });
                    for (let t = 0, i = e.length; t < i; t++) s[e[t].name] = e[t]
                }
                let r = null,
                    d = null,
                    c = null,
                    _ = null,
                    u = "",
                    g = !1;
                const m = 1 === t.length;
                for (let i = 0; i < t.length; i++) {
                    const n = t[i];
                    if (c = this._createModuleGroup(m), "object" == typeof n) {
                        for (let e = 0; e < n.length; e++) "object" == typeof(d = n[e]) ? "function" == typeof d.add ? (r = a[u = d.name], s[u] = d) : (u = d.name, r = [d.className, d.title, d.dataCommand, d.dataDisplay, d.displayOption, d.innerHTML]) : (r = a[d], u = d), _ = this._createButton(r[0], r[1], r[2], r[3], r[4]), c.ul.appendChild(_.li), s[u] && (s[u].buttonElement = _.button);
                        g && l.appendChild(o.cloneNode(!1)), l.appendChild(c.div), g = !0
                    } else if (/^\/$/.test(n)) {
                        const t = e.createElement("DIV");
                        t.className = "tool_module_enter", l.appendChild(t), g = !1
                    }
                }
                const h = e.createElement("DIV");
                return h.className = "sun-editor-id-toolbar-cover", l.appendChild(h), {
                    element: l,
                    plugins: s
                }
            }
        };
        var y = function(e, t, i) {
                return {
                    element: {
                        originElement: e,
                        topArea: t._top,
                        relative: t._relative,
                        toolbar: t._toolBar,
                        resizingBar: t._resizingBar,
                        navigation: t._navigation,
                        editorArea: t._editorArea,
                        wysiwyg: t._wysiwygArea,
                        code: t._codeArea,
                        loading: t._loading,
                        resizeBackground: t._resizeBack,
                        _stickyDummy: t._stickyDummy,
                        _arrow: t._arrow
                    },
                    tool: {
                        cover: t._toolBar.getElementsByClassName("sun-editor-id-toolbar-cover")[0],
                        bold: t._toolBar.getElementsByClassName("sun-editor-id-bold")[0],
                        underline: t._toolBar.getElementsByClassName("sun-editor-id-underline")[0],
                        italic: t._toolBar.getElementsByClassName("sun-editor-id-italic")[0],
                        strike: t._toolBar.getElementsByClassName("sun-editor-id-strike")[0],
                        subscript: t._toolBar.getElementsByClassName("sun-editor-id-subscript")[0],
                        superscript: t._toolBar.getElementsByClassName("sun-editor-id-superscript")[0],
                        font: t._toolBar.getElementsByClassName("sun-editor-font-family")[0],
                        format: t._toolBar.getElementsByClassName("sun-editor-font-format")[0],
                        fontSize: t._toolBar.getElementsByClassName("sun-editor-font-size")[0]
                    },
                    option: {
                        mode: i.mode,
                        toolbarWidth: i.toolbarWidth,
                        stickyToolbar: i.stickyToolbar,
                        resizingBar: i.resizingBar,
                        showPathLabel: i.showPathLabel,
                        popupDisplay: i.popupDisplay,
                        display: i.display,
                        height: i.height,
                        minHeight: i.minHeight,
                        maxHeight: i.maxHeight,
                        font: i.font,
                        fontSize: i.fontSize,
                        colorList: i.colorList,
                        imageResizing: i.imageResizing,
                        imageWidth: i.imageWidth,
                        imageFileInput: i.imageFileInput,
                        imageUrlInput: i.imageUrlInput,
                        imageUploadUrl: i.imageUploadUrl,
                        videoResizing: i.videoResizing,
                        videoWidth: i.videoWidth,
                        videoHeight: i.videoHeight
                    }
                }
            },
            E = {
                toolbar: {
                    font: "Font",
                    formats: "Formats",
                    fontSize: "Size",
                    bold: "Bold",
                    underline: "Underline",
                    italic: "Italic",
                    strike: "Strike",
                    subscript: "Subscript",
                    superscript: "Superscript",
                    removeFormat: "Remove Format",
                    fontColor: "Font Color",
                    hiliteColor: "Hilite Color",
                    indent: "Indent",
                    outdent: "Outdent",
                    align: "Align",
                    alignLeft: "Align left",
                    alignRight: "Align right",
                    alignCenter: "Align center",
                    justifyFull: "Justify full",
                    list: "list",
                    orderList: "Ordered list",
                    unorderList: "Unordered list",
                    horizontalRule: "horizontal line",
                    hr_solid: "solid",
                    hr_dotted: "dotted",
                    hr_dashed: "dashed",
                    table: "Table",
                    link: "Link",
                    image: "Image",
                    video: "Video",
                    fullScreen: "Full screen",
                    showBlocks: "Show blocks",
                    codeView: "Code view",
                    undo: "Undo",
                    redo: "Redo",
                    preview: "Preview",
                    print: "print",
                    tag_p: "Paragraph",
                    tag_div: "Normal (DIV)",
                    tag_h: "Header",
                    tag_quote: "Quote",
                    pre: "Code"
                },
                dialogBox: {
                    linkBox: {
                        title: "Insert Link",
                        url: "URL to link",
                        text: "Text to display",
                        newWindowCheck: "Open in new window"
                    },
                    imageBox: {
                        title: "Insert image",
                        file: "Select from files",
                        url: "Image URL",
                        altText: "Alternative text"
                    },
                    videoBox: {
                        title: "Insert Video",
                        url: "Media embed URL, YouTube"
                    },
                    caption: "Insert description",
                    close: "Close",
                    submitButton: "Submit",
                    revertButton: "Revert",
                    proportion: "constrain proportions",
                    width: "Width",
                    height: "Height",
                    basic: "Basic",
                    left: "Left",
                    right: "Right",
                    center: "Center"
                },
                controller: {
                    edit: "Edit",
                    remove: "Remove",
                    insertRowAbove: "Insert row above",
                    insertRowBelow: "Insert row below",
                    deleteRow: "Delete row",
                    insertColumnBefore: "Insert column before",
                    insertColumnAfter: "Insert column after",
                    deleteColumn: "Delete column",
                    resize100: "Resize 100%",
                    resize75: "Resize 75%",
                    resize50: "Resize 50%",
                    resize25: "Resize 25%",
                    mirrorHorizontal: "Mirror, Horizontal",
                    mirrorVertical: "Mirror, Vertical",
                    rotateLeft: "Rotate left",
                    rotateRight: "Rotate right"
                }
            },
            x = {
                init: function(e) {
                    const t = this;
                    return {
                        create: function(i, n) {
                            return t.create(i, n, e)
                        }
                    }
                },
                create: function(e, t, i) {
                    "object" != typeof t && (t = {}), i && (t = [p.a.copyObj(i), t].reduce(function(e, t) {
                        return Object.keys(t).forEach(function(i) {
                            e[i] = t[i]
                        }), e
                    }, {}));
                    const n = "string" == typeof e ? document.getElementById(e) : e;
                    if (!n) {
                        if ("string" == typeof e) throw Error('[SUNEDITOR.create.fail] The element for that id was not found (ID:"' + e + '")');
                        throw Error("[SUNEDITOR.create.fail] suneditor requires textarea's element or id value")
                    }
                    const o = v.init(n, t, t.lang || E, t.plugins);
                    if (o.constructed._top.id && document.getElementById(o.constructed._top.id)) throw Error('[SUNEDITOR.create.fail] The ID of the suneditor you are trying to create already exists (ID:"' + o.constructed._top.id + '")');
                    return n.style.display = "none", o.constructed._top.style.display = "block", "object" == typeof n.nextElementSibling ? n.parentNode.insertBefore(o.constructed._top, n.nextElementSibling) : n.parentNode.appendChild(o.constructed._top), b(y(n, o.constructed, o.options), o.plugins, o.options.lang)
                }
            };
        window.SUNEDITOR = x.init({
            plugins: h
        })
    },
    ee5k: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "resizing",
            add: function(core) {
                const context = core.context;
                context.resizing = {
                    _resizeClientX: 0,
                    _resizeClientY: 0,
                    _resize_plugin: "",
                    _resize_w: 0,
                    _resize_h: 0,
                    _origin_w: 0,
                    _origin_h: 0,
                    _rotateVertical: !1,
                    _resize_direction: ""
                };
                let resize_div_container = eval(this.setController_resize());
                context.resizing.resizeContainer = resize_div_container, context.resizing.resizeDiv = resize_div_container.getElementsByClassName("modal-resize")[0], context.resizing.resizeDot = resize_div_container.getElementsByClassName("resize-dot")[0], context.resizing.resizeDisplay = resize_div_container.getElementsByClassName("resize-display")[0];
                let resize_button = eval(this.setController_button(core.lang));
                context.resizing.resizeButton = resize_button, resize_button.addEventListener("mousedown", function(e) {
                    e.stopPropagation()
                }, !1);
                let resize_handles = context.resizing.resizeHandles = resize_div_container.querySelectorAll(".sun-editor-name-resize-handle");
                context.resizing.resizeButtonGroup = resize_button.getElementsByClassName("sun-editor-id-resize-button-group")[0], resize_handles[0].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[1].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[2].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[3].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[4].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[5].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[6].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_handles[7].addEventListener("mousedown", this.onMouseDown_resize_handle.bind(core)), resize_button.addEventListener("click", this.onClick_resizeButton.bind(core)), context.element.relative.appendChild(resize_div_container), context.element.relative.appendChild(resize_button), resize_div_container = null, resize_button = null, resize_handles = null
            },
            setController_resize: function() {
                const e = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return e.className = "modal-resize-container", e.style.display = "none", e.innerHTML = '<div class="modal-resize">   <div class="resize-display"></div></div><div class="resize-dot">   <div class="tl sun-editor-name-resize-handle"></div>   <div class="tr sun-editor-name-resize-handle"></div>   <div class="bl sun-editor-name-resize-handle"></div>   <div class="br sun-editor-name-resize-handle"></div>   <div class="lw sun-editor-name-resize-handle"></div>   <div class="th sun-editor-name-resize-handle"></div>   <div class="rw sun-editor-name-resize-handle"></div>   <div class="bh sun-editor-name-resize-handle"></div></div>', e
            },
            setController_button: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "resize-btn", t.style.display = "none", t.innerHTML = '<div class="arrow arrow-up"></div><div class="btn-group sun-editor-id-resize-button-group">   <button type="button" data-command="percent" data-value="1" title="' + e.controller.resize100 + '"><span class="note-fontsize-10">100%</span></button>   <button type="button" data-command="percent" data-value="0.75" title="' + e.controller.resize75 + '"><span class="note-fontsize-10">75%</span></button>   <button type="button" data-command="percent" data-value="0.5" title="' + e.controller.resize50 + '"><span class="note-fontsize-10">50%</span></button>   <button type="button" data-command="percent" data-value="0.25" title="' + e.controller.resize25 + '"><span class="note-fontsize-10">25%</span></button>   <button type="button" data-command="rotate" data-value="-90" title="' + e.controller.rotateLeft + '"><div class="icon-rotate-left"></div></button>   <button type="button" data-command="rotate" data-value="90" title="' + e.controller.rotateRight + '"><div class="icon-rotate-right"></div></button></div><div class="btn-group">   <button type="button" data-command="mirror" data-value="h" title="' + e.controller.mirrorHorizontal + '"><div class="icon-mirror-horizontal"></div></button>   <button type="button" data-command="mirror" data-value="v" title="' + e.controller.mirrorVertical + '"><div class="icon-mirror-vertical"></div></button>   <button type="button" data-command="revert" title="' + e.dialogBox.revertButton + '"><div class="icon-revert"></div></button>   <button type="button" data-command="update" title="' + e.controller.edit + '"><div class="icon-modify"></div></button>   <button type="button" data-command="delete" title="' + e.controller.remove + '"><div aria-hidden="true" class="icon-delete"></div></button></div>', t
            },
            call_controller_resize: function(e, t) {
                const i = this.context.resizing;
                i._resize_plugin = t;
                const n = i.resizeContainer,
                    o = i.resizeDiv,
                    l = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getOffset(e),
                    a = i._rotateVertical = /^(90|270)$/.test(Math.abs(e.getAttribute("data-rotate")).toString()),
                    s = a ? e.offsetHeight : e.offsetWidth,
                    r = a ? e.offsetWidth : e.offsetHeight,
                    d = l.top,
                    c = l.left - this.context.element.wysiwyg.scrollLeft;
                n.style.top = d + "px", n.style.left = c + "px", n.style.width = s + "px", n.style.height = r + "px", o.style.top = "0px", o.style.left = "0px", o.style.width = s + "px", o.style.height = r + "px";
                let _ = e.getAttribute("data-align") || "basic";
                _ = "none" === _ ? "basic" : _, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(i.resizeDisplay, this.lang.dialogBox[_] + " (" + s + " x " + r + ")");
                const u = this.context[t]._resizing ? "flex" : "none",
                    g = i.resizeHandles;
                i.resizeButtonGroup.style.display = u;
                for (let e = 0, t = g.length; e < t; e++) g[e].style.display = u;
                this.controllersOn(i.resizeContainer, i.resizeButton);
                const m = this.context.element.relative.offsetWidth - c - i.resizeButton.offsetWidth;
                i.resizeButton.style.top = r + d + 60 + "px", i.resizeButton.style.left = c + (m < 0 ? m : 0) + "px", i._resize_w = s, i._resize_h = r;
                const h = (e.getAttribute("origin-size") || "").split(",");
                return i._origin_w = h[0] || e.naturalWidth, i._origin_h = h[1] || e.naturalHeight, {
                    w: s,
                    h: r,
                    t: d,
                    l: c
                }
            },
            cancel_controller_resize: function() {
                const e = this.context.resizing._rotateVertical;
                this.controllersOff(), this.context.element.resizeBackground.style.display = "none";
                const t = e ? this.context.resizing._resize_h : this.context.resizing._resize_w,
                    i = e ? this.context.resizing._resize_w : this.context.resizing._resize_h;
                this.plugins[this.context.resizing._resize_plugin].setSize.call(this, t, i, e), this.plugins.resizing.setTransformSize.call(this, this.context[this.context.resizing._resize_plugin]._element), this.plugins[this.context.resizing._resize_plugin].init.call(this)
            },
            create_caption: function() {
                const e = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("FIGCAPTION");
                return e.setAttribute("contenteditable", !0), e.innerHTML = "<p>" + this.lang.dialogBox.caption + "</p>", e
            },
            set_cover: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("FIGURE");
                return t.className = "sun-editor-figure-cover", t.appendChild(e), t
            },
            set_container: function(e, t) {
                const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return i.className = "sun-editor-id-comp " + t, i.setAttribute("contenteditable", !1), i.appendChild(e), i
            },
            onClick_resizeButton: function(e) {
                e.stopPropagation();
                const t = e.target,
                    i = t.getAttribute("data-command") || t.parentNode.getAttribute("data-command");
                if (!i) return;
                const n = t.getAttribute("data-value") || t.parentNode.getAttribute("data-value"),
                    o = this.context[this.context.resizing._resize_plugin]._element,
                    l = this.plugins[this.context.resizing._resize_plugin];
                if (e.preventDefault(), /percent/.test(i)) {
                    this.plugins.resizing.resetTransform.call(this, o), l.setPercentSize.call(this, 100 * n + "%", "auto");
                    const e = this.plugins.resizing.call_controller_resize.call(this, o, this.context.resizing._resize_plugin);
                    l.onModifyMode.call(this, o, e)
                } else if (/mirror/.test(i)) {
                    const e = o.getAttribute("data-rotate") || "0";
                    let t = o.getAttribute("data-rotateX") || "",
                        i = o.getAttribute("data-rotateY") || "";
                    "h" === n && !this.context.resizing._rotateVertical || "v" === n && this.context.resizing._rotateVertical ? i = i ? "" : "180" : t = t ? "" : "180", o.setAttribute("data-rotateX", t), o.setAttribute("data-rotateY", i), this.plugins.resizing._setTransForm(o, e, t, i)
                } else if (/rotate/.test(i)) {
                    const e = this.context.resizing,
                        t = 1 * o.getAttribute("data-rotate") + 1 * n,
                        i = Math.abs(t) >= 360 ? 0 : t;
                    o.setAttribute("data-rotate", i), e._rotateVertical = /^(90|270)$/.test(Math.abs(i).toString()), this.plugins.resizing.setTransformSize.call(this, o);
                    const a = this.plugins.resizing.call_controller_resize.call(this, o, e._resize_plugin);
                    l.onModifyMode.call(this, o, a)
                } else if (/revert/.test(i)) {
                    l.setAutoSize ? l.setAutoSize.call(this) : (l.resetAlign.call(this), this.plugins.resizing.resetTransform.call(this, o));
                    const e = this.plugins.resizing.call_controller_resize.call(this, o, this.context.resizing._resize_plugin);
                    l.onModifyMode.call(this, o, e)
                } else /update/.test(i) ? (l.openModify.call(this), this.controllersOff()) : /delete/.test(i) && l.destroy.call(this)
            },
            resetTransform: function(e) {
                const t = (e.getAttribute("data-origin") || "").split(",");
                this.context.resizing._rotateVertical = !1, e.style.transform = "", e.style.transformOrigin = "", e.setAttribute("data-rotate", ""), e.setAttribute("data-rotateX", ""), e.setAttribute("data-rotateY", ""), e.style.width = t[0] + "px" || !1, e.style.height = t[1] + "px" || !1, this.plugins.resizing.setTransformSize.call(this, e)
            },
            setTransformSize: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-figure-cover"),
                    i = this.context.resizing._rotateVertical,
                    n = 1 * e.getAttribute("data-rotate"),
                    o = e.offsetWidth,
                    l = e.offsetHeight,
                    a = i ? l : o,
                    s = i ? o : l;
                this.plugins[this.context.resizing._resize_plugin].cancelPercentAttr.call(this), this.plugins[this.context.resizing._resize_plugin].setSize.call(this, o, l), t.style.width = a + "px", t.style.height = this.context[this.context.resizing._resize_plugin]._caption ? "" : s + "px";
                let r = "";
                if (i) {
                    let e = o / 2 + "px " + o / 2 + "px 0",
                        t = l / 2 + "px " + l / 2 + "px 0";
                    r = 90 === n || -270 === n ? t : e
                }
                e.style.transformOrigin = r, this.plugins.resizing._setTransForm(e, n.toString(), e.getAttribute("data-rotateX") || "", e.getAttribute("data-rotateY") || ""), this.plugins.resizing._setCaptionPosition.call(this, e, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getChildElement(_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-figure-cover"), "FIGCAPTION"))
            },
            _setTransForm: function(e, t, i, n) {
                let o = (e.offsetWidth - e.offsetHeight) * (/-/.test(t) ? 1 : -1),
                    l = "";
                if (/[1-9]/.test(t) && (i || n)) switch (l = i ? "Y" : "X", t) {
                    case "90":
                        l = i && n ? "X" : n ? l : "";
                        break;
                    case "270":
                        o *= -1, l = i && n ? "Y" : i ? l : "";
                        break;
                    case "-90":
                        l = i && n ? "Y" : i ? l : "";
                        break;
                    case "-270":
                        o *= -1, l = i && n ? "X" : n ? l : "";
                        break;
                    default:
                        l = ""
                }
                e.style.transform = "rotate(" + t + "deg)" + (i ? " rotateX(" + i + "deg)" : "") + (n ? " rotateY(" + n + "deg)" : "") + (l ? " translate" + l + "(" + o + "px)" : "")
            },
            _setCaptionPosition: function(e, t) {
                t && (t.style.marginTop = (this.context.resizing._rotateVertical ? e.offsetWidth - e.offsetHeight : 0) + "px")
            },
            onMouseDown_resize_handle: function(e) {
                const t = this.context.resizing,
                    i = t._resize_direction = e.target.classList[0];
                e.stopPropagation(), e.preventDefault(), t._resizeClientX = e.clientX, t._resizeClientY = e.clientY, this.context.element.resizeBackground.style.display = "block", t.resizeButton.style.display = "none", t.resizeDiv.style.float = /l/.test(i) ? "right" : /r/.test(i) ? "left" : "none";
                const n = function() {
                        this.plugins.resizing.cancel_controller_resize.call(this), document.removeEventListener("mousemove", o), document.removeEventListener("mouseup", n)
                    }.bind(this),
                    o = this.plugins.resizing.resizing_element.bind(this, t, i, this.context[t._resize_plugin]);
                document.addEventListener("mousemove", o), document.addEventListener("mouseup", n)
            },
            resizing_element: function(e, t, i, n) {
                const o = n.clientX,
                    l = n.clientY;
                let a = i._element_w,
                    s = i._element_h;
                const r = i._element_w + (/r/.test(t) ? o - e._resizeClientX : e._resizeClientX - o),
                    d = i._element_h + (/b/.test(t) ? l - e._resizeClientY : e._resizeClientY - l),
                    c = i._element_h / i._element_w * r;
                /t/.test(t) && (e.resizeDiv.style.top = i._element_h - (/h/.test(t) ? d : c) + "px"), /l/.test(t) && (e.resizeDiv.style.left = i._element_w - r + "px"), /r|l/.test(t) && (e.resizeDiv.style.width = r + "px", a = r), /^(t|b)[^h]$/.test(t) ? (e.resizeDiv.style.height = c + "px", s = c) : /^(t|b)h$/.test(t) && (e.resizeDiv.style.height = d + "px", s = d), e._resize_w = a, e._resize_h = s, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.changeTxt(e.resizeDisplay, Math.round(a) + " x " + Math.round(s))
            }
        }
    },
    g4XY: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "horizontalRule",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.lang));
                listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.horizontalRulePick.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-submenu layer_editor layer_line", t.style.display = "none", t.innerHTML = '<div class="inner_layer">   <ul class="list_editor">       <li>           <button type="button" class="btn_edit btn_line" data-command="horizontalRule" data-value="solid" title="' + e.toolbar.hr_solid + '">               <hr style="border-width: 1px 0 0; border-style: solid none none; border-color: black; border-image: initial; height: 1px;" />           </button>       </li>       <li>           <button type="button" class="btn_edit btn_line" data-command="horizontalRule" data-value="dotted" title="' + e.toolbar.hr_dotted + '">               <hr style="border-width: 1px 0 0; border-style: dotted none none; border-color: black; border-image: initial; height: 1px;" />           </button>       </li>       <li>           <button type="button" class="btn_edit btn_line" data-command="horizontalRule" data-value="dashed" title="' + e.toolbar.hr_dashed + '">               <hr style="border-width: 1px 0 0; border-style: dashed none none; border-color: black; border-image: initial; height: 1px;" />           </button>       </li>   </ul></div>', t
            },
            appendHr: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("HR");
                t.className = e, this.focus(), this.insertNode(t, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(this.getSelectionNode()));
                const i = this.appendFormatTag(t);
                this.setRange(i, 0, i, 0)
            },
            horizontalRulePick: function(e) {
                e.preventDefault(), e.stopPropagation();
                let t = e.target,
                    i = null;
                for (; !i && !/UL/i.test(t.tagName);) i = t.getAttribute("data-value"), t = t.parentNode;
                this.plugins.horizontalRule.appendHr.call(this, i), this.submenuOff(), this.focus()
            }
        }
    },
    gMuy: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d");
        __webpack_exports__.a = {
            name: "list",
            add: function(core, targetElement) {
                let listDiv = eval(this.setSubmenu(core.lang));
                listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-submenu layer_editor layer_list", t.style.display = "none", t.innerHTML = '<div class="inner_layer">   <ul class="list_editor">       <li><button type="button" class="btn_edit" data-command="insertOrderedList" data-value="OL" title="' + e.toolbar.orderList + '"><div class="icon-list-number"></div></button></li>       <li><button type="button" class="btn_edit" data-command="insertUnorderedList" data-value="UL" title="' + e.toolbar.unorderList + '"><div class="icon-list-bullets"></div></button></li>   </ul></div>', t
            },
            pickup: function(e) {
                e.preventDefault(), e.stopPropagation();
                let t = e.target,
                    i = "",
                    n = "";
                for (; !i && !/^UL$/i.test(t.tagName);) i = t.getAttribute("data-command"), n = t.getAttribute("data-value"), t = t.parentNode;
                const o = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(this.getSelectionNode());
                if (/^LI$/i.test(o.tagName)) {
                    const e = o.parentNode.tagName === n;
                    this.execCommand(i, !1, null), e && this.execCommand("formatBlock", !1, "DIV")
                } else {
                    let e = o.nextSibling,
                        t = o.parentNode;
                    const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement(n),
                        l = this.getSelectedFormatElements();
                    for (let n = 0, o = l.length, a = null; n < o; n++) a = l[n], n === o - 1 && (e = a.nextSibling, t = a.parentNode), i.innerHTML += "<li>" + a.innerHTML + "</li>", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(a);
                    t.insertBefore(i, e)
                }
                this.submenuOff(), this.focus()
            }
        }
    },
    hlhS: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d"),
            _modules_dialog__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__("1kvd"),
            _modules_resizing__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__("ee5k");
        __webpack_exports__.a = {
            name: "video",
            add: function(core) {
                core.addModule([_modules_dialog__WEBPACK_IMPORTED_MODULE_1__.a, _modules_resizing__WEBPACK_IMPORTED_MODULE_2__.a]);
                const context = core.context;
                context.video = {
                    _container: null,
                    _cover: null,
                    _element: null,
                    _resizingDiv: null,
                    _element_w: context.option.videoWidth,
                    _element_h: context.option.videoHeight,
                    _element_l: 0,
                    _element_t: 0,
                    _origin_w: context.option.videoWidth,
                    _origin_h: context.option.videoHeight,
                    _caption: null,
                    captionCheckEl: null,
                    _captionChecked: !1,
                    _proportionChecked: !0,
                    _align: "none",
                    _floatClassRegExp: "float\\-[a-z]+",
                    _resizing: context.option.videoResizing
                };
                let video_dialog = eval(this.setDialog(core.context.option, core.lang));
                context.video.modal = video_dialog, context.video.focusElement = video_dialog.getElementsByClassName("sun-editor-id-video-url")[0], context.video.captionCheckEl = video_dialog.getElementsByClassName("suneditor-id-video-check-caption")[0], video_dialog.getElementsByClassName("btn-primary")[0].addEventListener("click", this.submit.bind(core)), context.video.videoWidth = {}, context.video.videoHeight = {}, context.option.videoResizing && (context.video.videoWidth = video_dialog.getElementsByClassName("sun-editor-id-video-x")[0], context.video.videoHeight = video_dialog.getElementsByClassName("sun-editor-id-video-y")[0], context.video.proportion = video_dialog.getElementsByClassName("suneditor-id-video-check-proportion")[0], context.video.videoWidth.value = context.option.videoWidth, context.video.videoHeight.value = context.option.videoHeight, context.video.videoWidth.addEventListener("change", this.setInputSize.bind(core, "x")), context.video.videoHeight.addEventListener("change", this.setInputSize.bind(core, "y")), video_dialog.getElementsByClassName("sun-editor-id-video-revert-button")[0].addEventListener("click", this.sizeRevert.bind(core))), context.dialog.modal.appendChild(video_dialog), video_dialog = null
            },
            setDialog: function(e, t) {
                const i = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                i.className = "modal-content sun-editor-id-dialog-video", i.style.display = "none";
                let n = '<form class="editor_video">   <div class="modal-header">       <button type="button" data-command="close" class="close" aria-label="Close" title="' + t.dialogBox.close + '">           <div aria-hidden="true" data-command="close" class="icon-cancel"></div>       </button>       <h5 class="modal-title">' + t.dialogBox.videoBox.title + '</h5>   </div>   <div class="modal-body">       <div class="form-group">           <label>' + t.dialogBox.videoBox.url + '</label>           <input class="form-control sun-editor-id-video-url" type="text" />       </div>';
                return e.videoResizing && (n += '   <div class="form-group">       <div class="size-text"><label class="size-w">' + t.dialogBox.width + '</label><label class="size-x">&nbsp;</label><label class="size-h">' + t.dialogBox.height + '</label></div>       <input type="number" class="form-size-control sun-editor-id-video-x" /><label class="size-x">x</label><input type="number" class="form-size-control sun-editor-id-video-y" />       <label><input type="checkbox" class="suneditor-id-video-check-proportion" style="margin-left: 20px;" checked/>&nbsp;' + t.dialogBox.proportion + '</label>       <button type="button" title="' + t.dialogBox.revertButton + '" class="btn_editor sun-editor-id-video-revert-button" style="float: right;"><div class="icon-revert"></div></button>   </div>'), n += '       <div class="form-group-footer">           <label><input type="checkbox" class="suneditor-id-video-check-caption" />&nbsp;' + t.dialogBox.caption + '</label>       </div>   </div>   <div class="modal-footer">       <div style="float: left;">           <label><input type="radio" name="suneditor_video_radio" class="modal-radio" value="none" checked>' + t.dialogBox.basic + '</label>           <label><input type="radio" name="suneditor_video_radio" class="modal-radio" value="left">' + t.dialogBox.left + '</label>           <label><input type="radio" name="suneditor_video_radio" class="modal-radio" value="center">' + t.dialogBox.center + '</label>           <label><input type="radio" name="suneditor_video_radio" class="modal-radio" value="right">' + t.dialogBox.right + '</label>       </div>       <button type="submit" class="btn btn-primary sun-editor-id-submit-video" title="' + t.dialogBox.submitButton + '"><span>' + t.dialogBox.submitButton + "</span></button>   </div></form>", i.innerHTML = n, i
            },
            setInputSize: function(e) {
                this.context.video.proportion.checked && ("x" === e ? this.context.video.videoHeight.value = Math.round(this.context.video._element_h / this.context.video._element_w * this.context.video.videoWidth.value) : this.context.video.videoWidth.value = Math.round(this.context.video._element_w / this.context.video._element_h * this.context.video.videoHeight.value))
            },
            submit: function(e) {
                this.showLoading(), e.preventDefault(), e.stopPropagation(), this.context.video._captionChecked = this.context.video.captionCheckEl.checked;
                const t = function() {
                    if (0 === this.context.video.focusElement.value.trim().length) return !1;
                    const e = this.context.video,
                        t = /^\d+$/.test(e.videoWidth.value) ? e.videoWidth.value : this.context.option.videoWidth,
                        i = /^\d+$/.test(e.videoHeight.value) ? e.videoHeight.value : this.context.option.videoHeight;
                    let n = null,
                        o = null,
                        l = null,
                        a = null,
                        s = e.focusElement.value.trim();
                    e._align = e.modal.querySelector('input[name="suneditor_video_radio"]:checked').value, /^<iframe.*\/iframe>$/.test(s) ? o = (new DOMParser).parseFromString(s, "text/html").getElementsByTagName("iframe")[0] : (o = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("IFRAME"), /youtu\.?be/.test(s) && (s = s.replace("watch?v=", ""), /^\/\/.+\/embed\//.test(s) || (s = s.replace(s.match(/\/\/.+\//)[0], "//www.youtube.com/embed/"))), o.src = s), this.context.dialog.updateModal ? (e._element.src = o.src, a = e._container, l = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e._element, ".sun-editor-figure-cover"), o = e._element, n = e._resizingDiv) : (o.frameBorder = "0", o.allowFullscreen = !0, o.contentDocument, o.onload = function() {
                        this.setAttribute("origin-size", this.offsetWidth + "," + this.offsetHeight), this.setAttribute("data-origin", this.offsetWidth + "," + this.offsetHeight), this.style.height = this.offsetHeight + "px"
                    }.bind(o), e._element = o, l = this.plugins.resizing.set_cover.call(this, o), e._resizingDiv = n = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV"), n.className = "sun-editor-id-iframe-inner-resizing-cover", l.appendChild(n), a = this.plugins.resizing.set_container.call(this, l, "sun-editor-id-iframe-container"));
                    const r = 1 * t !== o.offsetWidth || 1 * i !== o.offsetHeight;
                    e._resizing && (this.context.video._proportionChecked = e.proportion.checked, o.setAttribute("data-proportion", e._proportionChecked)), e._captionChecked ? e._caption || (e._caption = this.plugins.resizing.create_caption.call(this), l.appendChild(e._caption)) : e._caption && (_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(e._caption), e._caption = null), r && this.plugins.video.setSize.call(this, t, i), e._align && "none" !== e._align ? l.style.margin = "auto" : l.style.margin = "0", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(a, this.context.video._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(a, "float-" + e._align), o.setAttribute("data-align", e._align), this.context.dialog.updateModal ? (e._resizing && r || this.context.resizing._rotateVertical && e._captionChecked) && this.plugins.resizing.setTransformSize.call(this, o) : (this.insertNode(a, _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getFormatElement(this.getSelectionNode())), this.appendFormatTag(a))
                }.bind(this);
                try {
                    t()
                } finally {
                    this.plugins.dialog.close.call(this), this.closeLoading()
                }
                return this.focus(), !1
            },
            sizeRevert: function() {
                const e = this.context.video;
                e._origin_w && (e.videoWidth.value = e._element_w = e._origin_w, e.videoHeight.value = e._element_h = e._origin_h)
            },
            onModifyMode: function(e, t) {
                const i = this.context.video;
                i._element = e, i._cover = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-figure-cover"), i._container = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getParentElement(e, ".sun-editor-id-iframe-container"), i._caption = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getChildElement(i._cover, "FIGCAPTION"), i._resizingDiv = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.getChildElement(i._cover, ".sun-editor-id-iframe-inner-resizing-cover"), i._align = e.getAttribute("data-align") || "none", i._element_w = t.w, i._element_h = t.h, i._element_t = t.t, i._element_l = t.l;
                let n = i._element.getAttribute("data-origin");
                n ? (n = n.split(","), i._origin_w = 1 * n[0], i._origin_h = 1 * n[1]) : (i._origin_w = t.w, i._origin_h = t.h, i._element.setAttribute("data-origin", t.w + "," + t.h))
            },
            openModify: function() {
                const e = this.context.video;
                e.focusElement.value = e._element.src, e.videoWidth.value = e._element.offsetWidth, e.videoHeight.value = e._element.offsetHeight, e._captionChecked = e.captionCheckEl.checked = !!e._caption, e.modal.querySelector('input[name="suneditor_video_radio"][value="' + e._align + '"]').checked = !0, e._resizing && (e.proportion.checked = e._proportionChecked = "true" === e._element.getAttribute("data-proportion"), e.proportion.disabled = !1), this.plugins.dialog.open.call(this, "video", !0)
            },
            setSize: function(e, t, i) {
                const n = this.context.video;
                n._element.style.width = e + "px", n._element.style.height = t + "px", n._resizingDiv.style.height = (i ? e : t) + "px"
            },
            setPercentSize: function(e) {
                const t = this.context.video;
                t._container.style.width = e, t._container.style.height = "", t._cover.style.width = "100%", t._cover.style.height = "", t._element.style.width = "100%", t._element.style.height = t._resizingDiv.style.height = t._origin_h / t._origin_w * t._element.offsetWidth + "px", /100/.test(e) && (_lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(t._container, this.context.video._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(t._container, "float-center"))
            },
            cancelPercentAttr: function() {
                const e = this.context.video;
                e._cover.style.width = "", e._cover.style.height = "", e._container.style.width = "", e._container.style.height = "", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(e._container, this.context.video._floatClassRegExp), _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.addClass(e._container, "float-" + e._align)
            },
            resetAlign: function() {
                const e = this.context.video;
                e._element.setAttribute("data-align", ""), e._align = "none", e._cover.style.margin = "0", _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeClass(e._container, e._floatClassRegExp)
            },
            destroy: function() {
                _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.removeItem(this.context.video._container), this.plugins.video.init.call(this), this.controllersOff()
            },
            init: function() {
                const e = this.context.video;
                e.focusElement.value = "", e.captionCheckEl.checked = !1, e.modal.querySelector('input[name="suneditor_video_radio"][value="none"]').checked = !0, e._resizing && (e.videoWidth.value = this.context.option.videoWidth, e.videoHeight.value = this.context.option.videoHeight, e.proportion.checked = !0, e.proportion.disabled = !0)
            }
        }
    },
    s0fJ: function(module, __webpack_exports__, __webpack_require__) {
        "use strict";
        var _lib_util__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__("8e1d"),
            _modules_colorPicker__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__("EjF6");
        __webpack_exports__.a = {
            name: "hiliteColor",
            add: function(core, targetElement) {
                core.addModule([_modules_colorPicker__WEBPACK_IMPORTED_MODULE_1__.a]);
                const context = core.context;
                context.hiliteColor = {
                    previewEl: null,
                    colorInput: null
                };
                let listDiv = eval(this.setSubmenu(context.colorPicker.colorListHTML));
                context.hiliteColor.colorInput = listDiv.getElementsByClassName("sun-editor-id-submenu-color-input")[0], context.hiliteColor.colorInput.addEventListener("keyup", this.onChangeInput.bind(core)), listDiv.getElementsByClassName("sun-editor-id-submenu-color-submit")[0].addEventListener("click", this.submit.bind(core)), listDiv.getElementsByTagName("UL")[0].addEventListener("click", this.pickup.bind(core)), targetElement.parentNode.appendChild(listDiv), listDiv = null
            },
            setSubmenu: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("DIV");
                return t.className = "sun-editor-submenu layer_editor", t.style.display = "none", t.innerHTML = e, t
            },
            on: function() {
                const e = this.context.colorPicker;
                e._colorInput = this.context.hiliteColor.colorInput, e._defaultColor = "#FFFFFF", e._styleProperty = "backgroundColor", this.plugins.colorPicker.init.call(this, this.getSelectionNode(), null)
            },
            onChangeInput: function(e) {
                this.plugins.colorPicker.setCurrentColor.call(this, "#" + e.target.value)
            },
            submit: function() {
                this.plugins.hiliteColor.applyColor.call(this, this.context.colorPicker._currentColor)
            },
            pickup: function(e) {
                if (e.preventDefault(), e.stopPropagation(), !/^BUTTON$/i.test(e.target.tagName)) return !1;
                this.plugins.hiliteColor.applyColor.call(this, e.target.getAttribute("data-value"))
            },
            applyColor: function(e) {
                const t = _lib_util__WEBPACK_IMPORTED_MODULE_0__.a.createElement("SPAN");
                t.style.backgroundColor = e, this.nodeChange(t, ["background-color"]), this.submenuOff(), this.focus()
            }
        }
    }
});
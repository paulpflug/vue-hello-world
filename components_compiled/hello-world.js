var __vue_template__ = "<h1 v-repeat=\"hello : hellos\">Hello {{hello.toLower()}}!</h1>\n  <input v-model=\"input\" v-on=\"keyup:add | key enter\" placeholder=\"whom to greet\" autocomplete=\"off\">";
module.exports = {
  data: function() {
    return {
      input: "",
      hellos: ["World"]
    };
  },
  methods: {
    add: function() {
      this.hellos.push(this.input);
      return this.input = "";
    }
  }
};

;(typeof module.exports === "function"? module.exports.options: module.exports).template = __vue_template__;

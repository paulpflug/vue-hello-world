var __vue_template__ = "<h1 v-repeat=\"hello : hellos\">Hello {{hello}}!</h1>\n  <input v-model=\"input\" v-on=\"keyup:add | key 'enter'\" placeholder=\"whom to greet\" autocomplete=\"off\">\n  <br>\n  <some-comp></some-comp>";
module.exports = {
  data: function() {
    return {
      input: "",
      hellos: ["World"]
    };
  },
  methods: {
    add: function() {
      this.log("test");
      this.hellos.push(this.input);
      return this.input = "";
    }
  },
  compiled: function() {
    return this.log("compiled");
  }
};

;(typeof module.exports === "function"? module.exports.options: module.exports).template = __vue_template__;

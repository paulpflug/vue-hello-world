module.exports = {
  el: "#hello-world",
  components: {
    "some-comp": require("./some-comp")
  },
  data: function() {
    return {
      input: "",
      hellos: ["World"],
      log: function() {}
    };
  },
  methods: {
    add: function() {
      this.log("adding " + this.input);
      this.hellos.push(this.input);
      return this.input = "";
    }
  },
  compiled: function() {
    return this.log("compiled");
  }
};

if (module.exports.__esModule) module.exports = module.exports.default
;(typeof module.exports === "function"? module.exports.options: module.exports).template = "\n  <h1 v-for=\"hello in hellos\">Hello {{hello}}!</h1>\n  <input v-model=\"input\" @keyup.enter=\"add\" placeholder=\"whom to greet\" autocomplete=\"off\">\n  <br>\n  <some-comp></some-comp>\n"
if (module.hot) {(function () {  module.hot.accept()
  var hotAPI = require("vue-hot-reload-api")
  hotAPI.install(require("vue"), true)
  if (!hotAPI.compatible) return
  var id = "/home/peaul"
  if (!module.hot.data) {
    hotAPI.createRecord(id, module.exports)
  } else {
    hotAPI.update(id, module.exports, (typeof module.exports === "function" ? module.exports.options : module.exports).template)
  }
})()}
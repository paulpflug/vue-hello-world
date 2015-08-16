# vue-hello-world package

Boilerplate package to use vue.js within atom.

## Install

Clone repository.

run
```sh
npm install

```

Link it to your packages folder.

## Notes
This package has a own [package reloader](https://github.com/paulpflug/atom-package-reloader) and [logger](https://github.com/paulpflug/atom-simple-logger) for faster developing, both aren't necessary.
Both work only in dev mode. The logger requires the debug config set to a value greater 0 for you project.

It also depends on my own [vue component compiler](https://github.com/paulpflug/atom-vue-component-compiler) and [loader](https://github.com/paulpflug/atom-vue-component-loader) wrapper, these are very simple and could be replaced by own code.
When you load vue by yourself keep in mind that you need the csp version of vue.

The compiler could be fully replaced by my [vue-autocompile](https://github.com/paulpflug/vue-autocompile) package

For a full scale example package see the source of my [opened-files](https://github.com/paulpflug/opened-files) package

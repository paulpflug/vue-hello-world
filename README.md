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
This package uses two services withing atom
- [autoreload-package-service](https://atom.io/packages/autoreload-package-service)
- [debug-service](https://atom.io/packages/debug-service)

both aren't necessary, but allow faster developing,
Both work only in dev mode. The logger requires the debug config set to a value greater 0 for you project.


For a full scale example package see the source of my [opened-files](https://github.com/paulpflug/opened-files) package

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.

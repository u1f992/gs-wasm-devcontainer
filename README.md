# gs-wasm-devcontainer

Dev container image for [u1f992/gs-wasm](https://github.com/u1f992/gs-wasm): [emscripten/emsdk](https://hub.docker.com/r/emscripten/emsdk) with autoconf, automake, and the clang-format and clang-tidy that match the bundled clang.

Every push to `main` builds the image, runs [test.sh](test.sh) inside it, and pushes it to `ghcr.io/u1f992/gs-wasm-devcontainer` tagged with the commit SHA.

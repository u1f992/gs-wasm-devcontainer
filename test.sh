#!/bin/sh
set -eu

autoconf --version
automake --version
clang-format --version
clang-tidy --version

cd "$(mktemp -d)"
cat > main.cpp <<'EOF'
#include <cstdio>
#include <string>

int main() {
  std::string message = "ok";
  std::puts(message.c_str());
}
EOF
em++ -std=c++17 main.cpp -o main.js
test "$(node main.js)" = ok

sysroot=/emsdk/upstream/emscripten/cache/sysroot/include
clang-tidy --checks='clang-analyzer-*,bugprone-*,modernize-*,performance-*' main.cpp -- \
  -std=c++17 \
  -isystem "$sysroot/c++/v1" \
  -isystem "$sysroot" \
  -isystem "$sysroot/compat" \
  --target=wasm32-unknown-emscripten

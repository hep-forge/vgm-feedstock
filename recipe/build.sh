#!/bin/bash
set -eo pipefail

cmake ${CMAKE_ARGS} -S "${SRC_DIR}" -B build \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD="$(root-config --cxxstandard)" \
    -DWITH_EXAMPLES=OFF \
    -DWITH_TEST=OFF
cmake --build build --parallel "${CPU_COUNT}" --target install

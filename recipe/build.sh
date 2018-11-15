#!/bin/bash

export CXXFLAGS="$CXXFLAGS -Wno-double-promotion -Wno-deprecated-dynamic-exception-spec -Wno-reserved-id-macro"

chmod +x configure

./configure --prefix=$PREFIX \
            --with-gmp-include="$PREFIX/include" \
            --with-gmp-lib="$PREFIX/lib" \
            --enable-coefficients=mpz \
            --enable-interfaces=c,c++
make
# Following timeouts on CI
# make check
make install

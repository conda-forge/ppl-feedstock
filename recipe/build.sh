#!/bin/bash

export CFLAGS="-O2 -g -fPIC $CFLAGS -Wno-double-promotion"

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

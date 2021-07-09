#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

export CXXFLAGS="$CXXFLAGS -Wno-double-promotion -Wno-deprecated-dynamic-exception-spec -Wno-reserved-id-macro"

if [[ "$CI" == "drone" ]]; then
  export CPU_COUNT=16
fi

chmod +x configure

./configure --prefix=$PREFIX \
            --with-gmp-include="$PREFIX/include" \
            --with-gmp-lib="$PREFIX/lib" \
            --enable-coefficients=mpz \
            --disable-fpmath \
            --enable-interfaces=c,c++
make
# Following timeouts on CI
# make check
make install

#!/bin/bash

set -eo pipefail

LANG=en_US.UTF-8
export LANG

infile=/tmp/infile$$

echo "io:println {" > $infile
cat >> $infile
echo "} 0" >> $infile

array/client-java/build/install/kap-jvm/bin/client-java --lib-path=array/array/standard-lib --no-repl --load=$infile

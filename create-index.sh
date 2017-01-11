#!/usr/bin/env bash
#usage create-index.sh thing.ttl
DIRECTORY=`dirname $0`
$DIRECTORY/apache-jena/bin/tdbloader2 --loc $DIRECTORY/indexed $1

#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    gtar czf indexed.tar.gz indexed
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    tar czf indexed.tar.gz indexed
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo 'only mac/linux'
fi
#!/bin/bash

build_type=${1:-"debug"}    #set debug as default build type if it's not specified on the command line
build_type=${build_type,,}  #convert to lower-case
echo "build $build_type configuration"

#invoke cmake with the specified preset
cmake --build --preset $build_type
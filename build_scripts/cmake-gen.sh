#!/bin/bash
set -e

build_type=${1:-"debug"}    #set debug as default build type if it's not specified on the command line
build_type=${build_type,,}  #convert to lower-case
echo "generating build system for $build_type configuration"

#invoke cmake with the specified preset (source dir is the current directory)
cmake --preset $build_type


#!/bin/bash


if [[ $EUID -ne 0 ]]; then
    echo "This script has to be run as sudo ./tdd_cpp_setup.sh" 2>&1
    exit 1
else
    echo "About to install build-essential"
    sudo apt-get install build-essential -y
    echo "About to install cmake"
    sudo apt-get install cmake -y
    # Build googletests library
    export GMOCK_HOME=$PWD/googletest
    echo "Setting GMOCK_HOME variable to $GMOCK_HOME"
    echo "About to build google test"
    cd ./googletest
    mkdir -p mybuild
    cd mybuild
    cmake -G"Unix Makefiles" ..
    make
    # Build cpputest library
    cd ../..
    export CPPUTEST_HOME=$PWD/cpputest
    echo "Setting CPPUTEST_HOME variable to $CPPUTEST_HOME"
    echo "About to build cpputest"
    cd ./cpputest/cpputest_build
    cmake ..
    make
    # Build libcurl
    cd ../..
    export CURL_HOME=$PWD/curl
    cd $CURL_HOME
    mkdir -p build
    cd build
    cmake ..
    make
fi

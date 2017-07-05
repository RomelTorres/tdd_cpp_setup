#!/bin/bash


if [[ $EUID -ne 0 ]]; then
    echo "This script has to be run as sudo ./tdd_cpp_setup.sh" 2>&1
    exit 1
else
    echo "About to install build-essential"
    sudo apt-get install build-essential -y
    echo "About to install cmake"
    sudo apt-get install cmake -y
    # From here we build googletests library
    export GMOCK_HOME=$PWD/googletest
    echo "Setting GMOCK_HOME variable to $GMOCK_HOME"
    echo "About to build google test"
    cd ./googletest
    mkdir mybuild
    cd mybuild
    cmake -G"Unix Makefiles" ..
    make
fi

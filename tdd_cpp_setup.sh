#!/bin/bash


if [[ $EUID -ne 0 ]]; then
  echo "This script has to be run as sudo ./tdd_cpp_setup.sh" 2>&1
  exit 1
else
  echo "About to install build-essential"
  sudo apt-get install build-essential -y
  echo "About to install cmake"
  sudo apt-get install cmake -y
fi

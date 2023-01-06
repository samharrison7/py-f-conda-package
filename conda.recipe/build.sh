#!/usr/bin/env bash
set -ex

# Create the lib directory to store the Fortran library in
LIB_DIR="${PREFIX}/lib"
mkdir -p $LIB_DIR

# Compile the library using GFortran
gfortran -shared ./src/pyf/quadratic.f90 -o "${LIB_DIR}/quadratic.so"

# Install the Python package, but without dependencies,
# because Conda takes care of that
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
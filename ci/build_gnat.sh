#!/usr/bin/env bash

set -e

echo "Building AdaVTT..."

mkdir -p obj

gprbuild -P adavtt.gpr

echo "Build completed."

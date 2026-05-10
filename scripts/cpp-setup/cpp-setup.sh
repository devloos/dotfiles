#!/bin/bash

mkdir include build lib src src/core .vscode
touch include/.gitkeep lib/.gitkeep

-gitignore.sh
-cmake.sh
-vscode.sh
-clang-format.sh

sed "s/\"/'/g" temp.txt > .clang-format
rm temp.txt

cd build;
cmake ..

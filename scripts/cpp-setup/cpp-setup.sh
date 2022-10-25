#!/bin/bash

mkdir include build bin lib src src/core .vscode
touch bin/.gitkeep include/.gitkeep lib/.gitkeep

-gitignore.sh
-cmake.sh
-vscode.sh
-clang-format.sh

sed "s/\"/'/g" temp.txt > .clang-format
rm temp.txt

cd build;
cmake ..

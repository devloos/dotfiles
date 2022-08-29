#!/bin/bash

Make_Dirs() {
  mkdir $1 $2 $3 $4 $5 $6 $7
}

Make_Dirs include build bin lib src src/core .vscode

Touch_File() {
  touch $1 $2 $3 $4 $5
}

Touch_File src/core/Application.cpp CMakeLists.txt .vscode/c_cpp_properties.json .vscode/launch.json .vscode/settings.json
Touch_File bin/.gitkeep include/.gitkeep lib/.gitkeep .clang-format temp.txt

hGitignore.sh
hCmake.sh
hVscode.sh
hClangFormat.sh

sed "s/\"/'/g" temp.txt > .clang-format
rm temp.txt

cd build;
cmake ..

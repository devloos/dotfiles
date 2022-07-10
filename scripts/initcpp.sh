#!/bin/bash

mkdir include build bin lib src .vscode
touch src/main.cpp CmakeLists.txt .vscode/c_cpp_properties.json
touch .vscode/launch.json .vscode/settings.json
touch .clang-format temp.txt

gitignore.sh
helperCmake.sh
helperVscode.sh
helperClangFormat.sh

sed "s/\"/'/g" temp.txt > .clang-format
rm temp.txt

cd build;
cmake ..

#!/bin/bash

echo 'cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

project(main)

add_executable(${PROJECT_NAME} src/core/main.cpp)

# Letting CMake find library
# find_library(${LIB_NAME} ${LIB_TO_FIND} PATHS /tmp/customPath)
# User explicitly finding library
# target_include_directories(${PROJECT_NAME} PUBLIC ${LIB_HEADER_FILES})
# target_link_libraries(${PROJECT_NAME} PUBLIC ${LIB_TO_INCLUDE})' > CMakeLists.txt

echo '#ifndef MAIN_H_
#define MAIN_H_
#include <iostream>

#endif // MAIN_H_' > src/core/main.h

echo '#include "main.h"

int main() {
  std::cout << "Hello World!\n";
  return 0;
}' > src/core/main.cpp
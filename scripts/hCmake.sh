#!/bin/bash

echo 'cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

project(App)

add_executable(${PROJECT_NAME} src/core/Application.cpp)

# Letting CMake find library
# find_library(${LIB_NAME} ${LIB_TO_FIND} PATHS /tmp/customPath)
# User explicitly finding library
# target_include_directories(${PROJECT_NAME} PUBLIC ${LIB_HEADER_FILES})
# target_link_libraries(${PROJECT_NAME} PUBLIC ${LIB_TO_INCLUDE})' > CMakeLists.txt

echo '#ifndef APPLICATION_H_
#define APPLICATION_H_
#include <iostream>

#endif // APPLICATION_H_' > src/core/Application.h

echo '#include "Application.h"

int main() {
  return 0;
}' > src/core/Application.cpp

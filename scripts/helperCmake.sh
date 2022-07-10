#!/bin/bash

echo 'cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

project(main)

add_executable(${PROJECT_NAME} src/main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC /include)

# Letting CMake find library
# find_library(${LIB_NAME} ${LIB_TO_FIND} PATHS /tmp/customPath)
# User explicitly finding library
# target_include_directories(${PROJECT_NAME} PUBLIC ${LIB_HEADER_FILES})
# target_link_libraries(${PROJECT_NAME} PUBLIC ${LIB_TO_INCLUDE})' > CmakeLists.txt

echo '#include <iostream>

int main() {
  std::cout << "Hello World!";
  return 0;
}' > src/main.cpp
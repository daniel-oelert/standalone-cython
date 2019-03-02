project(standalone-cython)
cmake_minimum_required(VERSION 3.5.0)

set(GENC_DIR ${CMAKE_BINARY_DIR}/genc)

add_subdirectory(external)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
include(UseCython)

# add_subdirectory(src)
cmake_minimum_required(VERSION 3.22)

set(PROJECT_NAME "ClangTidyDiffTemplate")

project(${PROJECT_NAME} VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(EnableWarnings)

option(ENABLE_WARNINGS "Enable warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as errors" OFF)

option(ENABLE_SANITIZE_ADDR "Enable Address Sanitizer" ON)
option(ENABLE_SANITIZE_UNDEFINED "Enable Undefined Behaviour Sanitizer" ON)

if (ENABLE_SANITIZE_ADDR OR ENABLE_SANITIZE_UNDEFINED)
include(EnableSanitizers)
enable_sanitizers()
endif()

add_subdirectory(configured)
add_subdirectory(src)
add_subdirectory(include)
add_subdirectory(app)



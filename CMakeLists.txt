cmake_minimum_required(VERSION 3.25)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/CPM.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/vcpkg.cmake)

SetupVcpkg()

project(fibo CXX)

find_package(fmt REQUIRED)
find_package(range-v3 REQUIRED)
find_package(cxxopts REQUIRED)

CPMAddPackage(
    NAME asio
    GITHUB_REPOSITORY chriskohlhoff/asio
    GIT_TAG asio-1-24-0
    )

add_executable(fibo src/main.cxx)

target_link_libraries(fibo
  PRIVATE
    fmt::fmt
    range-v3::range-v3
    cxxopts::cxxopts
    asio)
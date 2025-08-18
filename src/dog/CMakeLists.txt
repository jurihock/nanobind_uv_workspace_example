cmake_minimum_required(VERSION 3.30)

project(dog LANGUAGES CXX)

if(${PROJECT_IS_TOP_LEVEL})
  add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/../pet" "${CMAKE_CURRENT_BINARY_DIR}/src/pet")
endif()

file(GLOB SRC "${CMAKE_CURRENT_LIST_DIR}/*.cpp")
file(GLOB HDR "${CMAKE_CURRENT_LIST_DIR}/*.h")

add_library(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
  PRIVATE
    "${SRC}"
  PUBLIC
    FILE_SET HEADERS
    FILES "${HDR}"
    BASE_DIRS "${CMAKE_CURRENT_LIST_DIR}/..")

target_link_libraries(${PROJECT_NAME}
  PUBLIC pet)

cmake_minimum_required(VERSION 3.30)

project(pypet LANGUAGES CXX)

if(${PROJECT_IS_TOP_LEVEL})
    add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/../pet" "${CMAKE_CURRENT_BINARY_DIR}/src/pet")
endif()

find_package(Python COMPONENTS Interpreter Development.Module REQUIRED)
find_package(nanobind CONFIG REQUIRED)

file(GLOB SRC "${CMAKE_CURRENT_LIST_DIR}/*.cpp")

nanobind_add_module(${PROJECT_NAME})

target_sources(${PROJECT_NAME} PRIVATE "${SRC}")

target_link_libraries(${PROJECT_NAME} PRIVATE pet)

install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION ${PROJECT_NAME})

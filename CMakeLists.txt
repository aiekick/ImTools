cmake_minimum_required(VERSION 3.1)

set(PROJECT ImTools)

enable_language(C CXX)

project(${PROJECT} CXX)

## for group make targets in the dir cmakeTargets
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "cmakeTargets")

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(3rdparty/3rdparty.cmake)
include(apps/apps.cmake)

include_directories(
	${CMAKE_SOURCE_DIR}/
	${CMAKE_SOURCE_DIR}/3rdparty
	${OPENGL_INCLUDE_DIR}
)


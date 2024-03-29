set(OpenGL_GL_PREFERENCE GLVND)
find_package(OpenGL REQUIRED)

if (CMAKE_SYSTEM_NAME STREQUAL Linux)
	find_package(X11 REQUIRED)
	if (NOT X11_Xi_FOUND)
		message(FATAL_ERROR "X11 Xi library is required")
	endif()
endif()

## ----------- GLAD ----------- ##
add_library(glad STATIC ${CMAKE_SOURCE_DIR}/3rdparty/glad/include/glad/glad.h ${CMAKE_SOURCE_DIR}/3rdparty/glad/src/glad.c)
set_target_properties(glad PROPERTIES FOLDER 3rdparty)
set(GLAD_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/glad/include)
set(GLAD_LIBRARIES ${GLAD_LIBRARIES} glad)
include_directories(${GLAD_INCLUDE_DIR})

## ----------- GLFW ----------- ##
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)
option(GLFW_INSTALL OFF)
add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/glfw)
set_target_properties(glfw PROPERTIES FOLDER 3rdparty)
set(GLFW_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/glfw/include)
add_definitions(-DGLFW_INCLUDE_NONE)
set(GLFW_LIBRARIES ${GLFW_LIBRARIES} glfw)
include_directories(${GLFW_INCLUDE_DIR})

## ----------- IMGUI ----------- ##
set(IMGUI_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/imgui)
file(GLOB IMGUI_SOURCES ${IMGUI_INCLUDE_DIR}/*.cpp ${IMGUI_INCLUDE_DIR}/*.h)
add_library(imgui STATIC ${IMGUI_SOURCES})
add_definitions(-DIMGUI_IMPL_OPENGL_LOADER_GLAD)  
target_link_libraries(imgui ${OPENGL_LIBRARIES} ${GLFW_LIBRARIES} ${GLAD_LIBRARIES})
set_target_properties(imgui PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(imgui PROPERTIES FOLDER 3rdparty)
set(IMGUI_LIBRARIES imgui)
include_directories(${IMGUI_INCLUDE_DIR})

## ----------- TINYXML2 ----------- ##
set(TINYXML2_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/tinyxml2)
file(GLOB TINYXML2_SOURCES ${TINYXML2_INCLUDE_DIR}/tinyxml2.h ${TINYXML2_INCLUDE_DIR}/tinyxml2.cpp)
add_library(tinyxml2 STATIC ${TINYXML2_SOURCES})
set_target_properties(tinyxml2 PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(tinyxml2 PROPERTIES FOLDER 3rdparty)
set(TINYXML2_LIBRARIES tinyxml2)

## ----------- CTOOLS ----------- ##
set(CTOOLS_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/ctools)
file(GLOB CTOOLS_SOURCES ${CTOOLS_INCLUDE_DIR}/*.cpp ${CTOOLS_INCLUDE_DIR}/*.h)
add_library(ctools STATIC ${CTOOLS_SOURCES})
target_link_libraries(ctools ${OPENGL_LIBRARIES} ${LIBGLFW3_LIBRARIES} ${LIBGLAD_LIBRARIES})
set_target_properties(ctools PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(ctools PROPERTIES FOLDER 3rdparty/aiekick)
add_definitions(-DGLAD)
add_definitions(-DIMGUI)
add_definitions(-DUSE_IMGUI="../imgui/imgui.h")
add_definitions(-DUSE_GLFW3)
set(CTOOLS_LIBRARIES ctools)
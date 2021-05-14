cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

## ------------ Layout Manager ------------ ##
file(GLOB APP_LAYOUT_MANAGER_SOURCES 
	${CMAKE_SOURCE_DIR}/apps/App_LayoutManager/*.cpp
	${CMAKE_SOURCE_DIR}/apps/App_LayoutManager/*.h
	${CMAKE_SOURCE_DIR}/LayoutManager/*.cpp
	${CMAKE_SOURCE_DIR}/LayoutManager/*.h
	${CMAKE_SOURCE_DIR}/3rdparty/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_SOURCE_DIR}/3rdparty/imgui/backends/imgui_impl_opengl3.h
	${CMAKE_SOURCE_DIR}/3rdparty/imgui/backends/imgui_impl_glfw.cpp
	${CMAKE_SOURCE_DIR}/3rdparty/imgui/backends/imgui_impl_glfw.h
)

add_executable(app_LayoutManager ${APP_LAYOUT_MANAGER_SOURCES})
target_link_libraries(app_LayoutManager PRIVATE
	${GLFW_LIBRARIES}
	${IMGUI_LIBRARIES}
	${CTOOLS_LIBRARIES}
	${TINYXML2_LIBRARIES}
)

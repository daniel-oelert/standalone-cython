add_pyx_library(pyxlibs OBJECT pymain.pyx greeter.pyx)
target_include_directories(pyxlibs PRIVATE ${CMAKE_SOURCE_DIR}/build/external/Python-3.6.7/Include ${CMAKE_SOURCE_DIR}/build/external/python-cmake-buildsystem/bin)

add_executable(main main.c $<TARGET_OBJECTS:pyxlibs>)
target_link_libraries(main PRIVATE libpython-static)
target_include_directories(main PRIVATE ${CMAKE_SOURCE_DIR}/build/external/Python-3.6.7/Include ${CMAKE_SOURCE_DIR}/build/external/python-cmake-buildsystem/bin)
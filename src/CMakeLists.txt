# function(add_pyx_module)
#     set(options OPTIONAL)
#     set(oneValueArgs TARGET)
#     set(multiValueArgs PYXFILES)
#     cmake_parse_arguments(PYX "${options}" "${oneValueArgs}"
#                         "${multiValueArgs}" ${ARGN} )
#     foreach(arg IN LISTS ARGN)
#         string(REGEX REPLACE "\\.[^.]*$" "" argwo ${arg})
#         add_custom_target(${PYX_TARGET} ALL
#                           COMMAND $<TARGET_FILE:python> cython ${arg} -o "${GENC_DIR}/${argwo}.c"
#                           WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/external/cython)
#         add_dependencies(cy_${arg} python)
#     endforeach()
# endfunction()

# add_pyx(pymain.pyx)

add_executable(main main.c pymain.c test.c)
target_link_libraries(main PRIVATE libpython-static)
target_include_directories(main PRIVATE ${CMAKE_SOURCE_DIR}/build/external/Python-3.6.7/Include ${CMAKE_SOURCE_DIR}/build/external/python-cmake-buildsystem/bin)
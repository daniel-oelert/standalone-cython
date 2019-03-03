configure_file(main.c.in ${GENC_DIR}/main.c)

function(add_pyx_module)
    set(options OPTIONAL)
    set(oneValueArgs TARGET)
    set(multiValueArgs PYXFILES)
    cmake_parse_arguments(PYX "${options}" "${oneValueArgs}"
                        "${multiValueArgs}" ${ARGN} )
    foreach(arg IN LISTS ARGN)
        string(REGEX REPLACE "\\.[^.]*$" "" argwo ${arg})
        add_custom_target(${PYX_TARGET} ALL
                          COMMAND $<TARGET_FILE:python> cython ${arg} -o "${GENC_DIR}/${argwo}.c"
                          WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/external/cython)
        add_dependencies(cy_${arg} python)
    endforeach()
endfunction()

add_pyx(pymain.pyx)
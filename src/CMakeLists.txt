configure_file(main.c.in ${GENC_DIR}/main.c)

function(add_pyx)
    foreach(arg IN LISTS ARGN)
        add_custom_target(cy_${arg} ALL
                          COMMAND $<TARGET_FILE:python> cythonize
                          WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/external/cython)
        add_dependencies(cy_${arg} python)
    endforeach()
endfunction()
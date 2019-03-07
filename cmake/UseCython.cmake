# Function add_pyx_library()
#     Syntax: add_pyx_library(<name> [STATIC | SHARED | OBJECT] <src>...)
#
#     This function produces a target with the name <name> and adds custom 
#     build steps to transpile the .pyx files into .c files inside the 
#     current binary dir.  

function(add_pyx_library TARGET_NAME TARGET_TYPE)
    message(STATUS "Target name is: ${TARGET_NAME}")
    message(STATUS "Target type is: ${TARGET_TYPE}")
    set(CFILES "")

    

    foreach(file IN LISTS ARGN)
        string(REGEX REPLACE "\\.[^.]*$" "" stripped_file ${file})
        set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${stripped_file}.c")
        message(STATUS "Adding CFILE: ${CFILE}")
        add_custom_command(
            OUTPUT 
                ${CFILE}
            COMMAND 
                $<TARGET_FILE:python> cython.py "${CMAKE_CURRENT_SOURCE_DIR}/${file}" -o "${CFILE}"
            WORKING_DIRECTORY 
                ${CMAKE_SOURCE_DIR}/external/cython
            DEPENDS
                python
        )

        list(APPEND CFILES ${CFILE})
        
        set_source_files_properties(
            ${CFILE}
            PROPERTIES GENERATED TRUE
        )
    endforeach()

    add_library(${TARGET_NAME} ${TARGET_TYPE} ${CFILES})

endfunction()
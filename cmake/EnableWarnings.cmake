function(enable_warnings_for_target TARGET ENABLE ENABLE_AS_ERROR)
    if (NOT ${ENABLE})
        message(STATUS "Warnings are disabled for target ${TARGET}")
        return()
    endif()

    set(GCC_WARNINGS
        -Wall
        -Wextra
        -Wpedantic)

    set(CLANG_WARNINGS ${GCC_WARNINGS})

    if (${ENABLE_AS_ERROR})
        set (GCC_WARNINGS ${GCC_WARNINGS} -Werror)
        set (CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
    endif()

    if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        set(WARNINGS ${GCC_WARNINGS})
    elseif (CMAKE_CXX_COMPILER_ID MATCHES "CLANG")
        set(WARNINGS ${CLANG_WARNINGS})
    endif()

    target_compile_options(${TARGET} PRIVATE ${WARNINGS})
    message(STATUS "Warnings are enabled for target ${TARGET}")

endfunction(enable_warnings_for_target)

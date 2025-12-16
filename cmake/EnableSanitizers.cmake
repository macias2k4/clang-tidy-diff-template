# function(enable_sanitize_for_target TARGET)
function(enable_sanitizers)
    if (NOT ${ENABLE_SANITIZE_ADDR} AND NOT ${ENABLE_SANITIZE_UNDEFINED})
        message(STATUS "Sanitizers are disabled")
        return()
    endif()

    if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "CLANG")
        message(ERROR "Current Compiler not supported for Sanitizers")
    endif()

    add_compile_options("-fno-omit-frame-pointer")
    add_link_options("-fno-omit-frame-pointer")

    if (${ENABLE_SANITIZE_ADDR})
        add_compile_options("-fsanitize=address")
        add_link_options("-fsanitize=address")
    endif()

    if (${ENABLE_SANITIZE_UNDEFINED})
        add_compile_options("-fsanitize=undefined")
        add_link_options("-fsanitize=undefined")
    endif()

    message(STATUS "Sanitizers are enabled ")

endfunction(enable_sanitizers)

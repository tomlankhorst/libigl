####################################################################################################
# This file builds dependency for ImGui+Spectrum, at https://github.com/adobe/imgui
#
# By default, it also builds the glfw + opengl3 example.
# For that to work, it requires glfw and gl3w.
#
# Feel free to change/remove the example and those dependencies.
####################################################################################################

if(TARGET imgui::imgui)
    return()
endif()

message(STATUS "Third-party (external): creating target 'imgui::imgui' ('docking' branch)")

include(FetchContent)
FetchContent_Declare(
    imgui
    GIT_REPOSITORY https://github.com/ocornut/imgui.git
    GIT_TAG 61b19489f1ba35934d9114c034b24eb5bff149e7 # 1.81 + patch for #1669
)
FetchContent_MakeAvailable(imgui)

add_library(imgui
    "${imgui_SOURCE_DIR}/imgui.h"
    "${imgui_SOURCE_DIR}/imgui_internal.h"
    "${imgui_SOURCE_DIR}/imgui.cpp"
    "${imgui_SOURCE_DIR}/imgui_demo.cpp"
    "${imgui_SOURCE_DIR}/imgui_draw.cpp"
    "${imgui_SOURCE_DIR}/imgui_widgets.cpp"
    "${imgui_SOURCE_DIR}/imgui_spectrum.h"
    "${imgui_SOURCE_DIR}/imgui_spectrum.cpp"
    "${imgui_SOURCE_DIR}/imgui_tables.cpp"
    "${imgui_SOURCE_DIR}/backends/imgui_impl_opengl3.h"
    "${imgui_SOURCE_DIR}/backends/imgui_impl_opengl3.cpp"
    "${imgui_SOURCE_DIR}/backends/imgui_impl_glfw.h"
    "${imgui_SOURCE_DIR}/backends/imgui_impl_glfw.cpp"
    "${imgui_SOURCE_DIR}/misc/cpp/imgui_stdlib.h"
    "${imgui_SOURCE_DIR}/misc/cpp/imgui_stdlib.cpp"
)
add_library(imgui::imgui ALIAS imgui)


# Dark theme option
option(IMGUI_USE_DARK_THEME "Use Dark ImGui Spectrum Theme" OFF)
if(IMGUI_USE_DARK_THEME)
    target_compile_definitions(imgui PUBLIC SPECTRUM_USE_DARK_THEME)
endif()

target_compile_definitions(imgui PUBLIC
    IMGUI_IMPL_OPENGL_LOADER_GL3W=1

    IMGUI_DISABLE_OBSOLETE_FUNCTIONS # to check for obsolete functions

    # IMGUI_USER_CONFIG="${PROJECT_SOURCE_DIR}/path/to/imconfig.h" # to use your own imconfig.h
)


target_include_directories(imgui PUBLIC "${imgui_SOURCE_DIR}")

include(glfw)
include(gl3w)
target_link_libraries(imgui PUBLIC glfw::glfw gl3w::gl3w)

set_target_properties(imgui PROPERTIES FOLDER third_party)

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(imgui PRIVATE
        "-Wno-ignored-qualifiers" "-Wno-unused-variable"
    )
endif()

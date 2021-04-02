if(TARGET imguizmo::imguizmo)
    return()
endif()

message(STATUS "Third-party (external): creating target 'imguizmo::imguizmo'")

include(FetchContent)
FetchContent_Declare(
    imguizmo
    GIT_REPOSITORY https://github.com/CedricGuillemet/ImGuizmo.git
    GIT_TAG ace44b6ddae5c9ee7e48d8e25589838ec40227fa
)
FetchContent_MakeAvailable(imguizmo)

add_library(imguizmo
    "${imguizmo_SOURCE_DIR}/ImGuizmo.h"
    "${imguizmo_SOURCE_DIR}/ImGuizmo.cpp"
)
add_library(imguizmo::imguizmo ALIAS imguizmo)

target_include_directories(imguizmo PUBLIC "${imguizmo_SOURCE_DIR}")

include(imgui)
target_link_libraries(imguizmo PUBLIC imgui::imgui)

set_target_properties(imguizmo PROPERTIES FOLDER third_party)

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function"
    )
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function"
    )
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function" "-Wno-deprecated-copy"
    )
endif()

function(igl_download_imguizmo)
    igl_download_project(imguizmo
        GIT_REPOSITORY https://github.com/CedricGuillemet/ImGuizmo.git
        GIT_TAG        a23567269f6617342bcc112394bdad937b54b2d7
        ${LIBIGL_BRANCH_OPTIONS}
    )
endfunction()

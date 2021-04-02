
function(igl_download_imgui)
    igl_download_project(imgui
        GIT_REPOSITORY https://github.com/ocornut/imgui.git
        GIT_TAG        61b19489f1ba35934d9114c034b24eb5bff149e7 # 1.81 + patch for #1669
        ${LIBIGL_BRANCH_OPTIONS}
    )
    igl_download_project(libigl-imgui
        GIT_REPOSITORY https://github.com/libigl/libigl-imgui.git
        GIT_TAG        7e1053e750b0f4c129b046f4e455243cb7f804f3
    )

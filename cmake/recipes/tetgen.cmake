
function(igl_download_tetgen)
    igl_download_project(tetgen
        GIT_REPOSITORY https://github.com/jdumas/tetgen.git
        GIT_TAG        c63e7a6434652b8a2065c835bd9d6d298db1a0bc
    )
endfunction()

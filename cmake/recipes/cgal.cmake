
function(igl_download_cgal)
    igl_download_project(cgal
        GIT_REPOSITORY https://github.com/CGAL/cgal.git
        GIT_TAG        f7c3c8212b56c0d6dae63787efc99093f4383415
    )
endfunction()


function(igl_download_cgal_deps)
  if(WIN32)
    igl_download_project(gmp
        URL     https://cgal.geometryfactory.com/CGAL/precompiled_libs/auxiliary/x64/GMP/5.0.1/gmp-all-CGAL-3.9.zip
        URL_MD5 508c1292319c832609329116a8234c9f
    )
    igl_download_project(mpfr
        URL https://cgal.geometryfactory.com/CGAL/precompiled_libs/auxiliary/x64/MPFR/3.0.0/mpfr-all-CGAL-3.9.zip
        URL_MD5 48840454eef0ff18730050c05028734b
    )
    set(ENV{GMP_DIR} "${LIBIGL_EXTERNAL}/gmp")
    set(ENV{MPFR_DIR} "${LIBIGL_EXTERNAL}/mpfr")
  endif()
endfunction()

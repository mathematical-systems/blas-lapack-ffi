(in-package :msi.blas-lapack-common)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *source-path*
    #.(make-pathname :directory (pathname-directory (or *compile-file-truename* *load-truename*)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (progn
    #+linux
    (cffi:load-foreign-library
     (merge-pathnames
      #+x86-64
      "lib/mkl_linux_em64t/libiomp5.so"
      #+x86
      "lib/mkl_linux_ia32/libiomp5.so"
      *default-pathname-defaults*))

    (cffi:load-foreign-library
     (merge-pathnames 
      #+(and linux x86-64)
      "lib/mkl_linux_em64t/mkl_linux_em64t.so"
      #+(and linux x86)
      "lib/mkl_linux_ia32/mkl_linux_ia32.so"
      #+(and windows x86)
      "lib/mkl_win32/mkl_win32.dll"
      #+(and windows x86-64)
      (error "Still in TODO list.")
      *default-pathname-defaults*))
    (pushnew :intel-mkl *features*)))


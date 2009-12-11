;;;; TODO: add copyright and license

;;; TODO: make customized blas/lapack shared libraries
(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:oos 'asdf:load-op :cffi))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (progn
    (cffi:load-foreign-library
     (merge-pathnames "src/lapack_wrapper.so" *load-truename*))
    (pushnew :intel-mkl *features*))
  ;; "liblapack.so"
  )

(asdf:defsystem blas
  :description "A BLAS binding."
  :author "MSI"
  :version "0.1"
  :depends-on (:alexandria :cffi :iterate)
  :components
  ((:module src
	    :components ((:file "preload")
			 (:file "packages")
			 (:file "ffi-utils" :depends-on ("packages"))
			 (:file "blas-lapack-common" :depends-on ("ffi-utils"))
			 (:file "blas" :depends-on ("blas-lapack-common")))
	    :serial t
	    )))


;;;; TODO: add copyright and license

;;; FIXME:

(eval-when (:compile-toplevel :load-toplevel :execute)
  (cffi:load-foreign-library "src/lapack_wrapper.so"))


(asdf:defsystem blas
  :description "A BLAS binding."
  :author "MSI"
  :version "0.1"
  :depends-on (:alexandria :cffi :iterate)
  :components
  ((:module src
	    :components ((:file "packages")
			 (:file "ffi-utils")
			 (:file "blas-lapack-common")
			 (:file "blas")
			 (:file "lapack"))
	    :serial t
	    )))


;;; TODO:
;;; make customized blas/lapack shared libraries


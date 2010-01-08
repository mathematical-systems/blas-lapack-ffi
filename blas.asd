;;;; TODO: add copyright and license

;;; TODO: make customized blas/lapack shared libraries
;; (cl:eval-when (:compile-toplevel :load-toplevel :execute)
;;   (loop for dir in (directory "addons/*/*.asd") do 
;;     (pushnew (make-pathname :directory (pathname-directory dir)) asdf:*central-registry* :test 'equal)))

(asdf:defsystem blas
  :description "A BLAS binding."
  :author "MSI"
  :version "0.1"
  :depends-on (:alexandria :cffi :iterate)
  :components
  ((:module src
	    :components ((:file "packages")
			 (:file "preload")
			 (:file "ffi-utils" :depends-on ("packages"))
			 (:file "blas-lapack-common" :depends-on ("ffi-utils"))
			 (:file "blas" :depends-on ("blas-lapack-common")))
	    :serial t
	    )))


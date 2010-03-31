(in-package :cl)

(defpackage :msi.ffi-utils
  (:use :cl :alexandria)
  (:export #:complex-float
	   #:complex-double
	   #:defffun
	   #:with-safe-foreign-function-call-settings
	   #:make-static-array
	   #:with-arrays-as-foreign-arrays
	   ))

(defpackage :msi.blas-lapack-common
  (:use :cl :alexandria :msi.ffi-utils)
  (:export #:blas-int
	   #:+precision-definitions+
	   #:+matrix-type-definitions+
	   #:defblas
	   #:deflapack
	   ))

(defpackage :msi.blas
  (:use :cl :alexandria :msi.ffi-utils :msi.blas-lapack-common))

(defpackage :msi.lapack
  (:use :cl :alexandria :msi.ffi-utils :msi.blas-lapack-common))



(in-package :cl)

(defpackage :msi.ffi-utils
  (:use :cl :alexandria :iterate)
  (:nicknames :ffi-utils)
  (:export #:complex-float
	   #:complex-double
	   #:defcfun
	   #:defffun
	   #:with-safe-foreign-function-call-settings
	   #:make-static-array
	   #:with-arrays-as-foreign-arrays
	   ))

(defpackage :msi.blas-lapack-common
  (:use :cl :alexandria :msi.ffi-utils)
  (:nicknames :blas-lapack-common)
  (:export #:blas-int
	   #:+precision-definitions+
	   #:+matrix-type-definitions+
	   #:defblas
	   ))

(defpackage :msi.blas
  (:use :cl :alexandria :msi.ffi-utils :msi.blas-lapack-common)
  (:nicknames :blas))

(defpackage :msi.lapack
  (:use :cl :alexandria :msi.ffi-utils :msi.blas-lapack-common)
  (:nicknames :lapack))



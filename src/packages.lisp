(in-package :cl)

(defpackage :msi.ffi-utils
  (:use :cl :alexandria)
  (:nicknames :ffi-utils)
  (:export #:defcfun
	   #:defffun
	   #:with-safe-foreign-function-call-settings
	   #:make-static-array
	   #:with-arrays-as-foreign-arrays))

(defpackage :msi.blas
  (:use :cl :alexandria :msi.ffi-utils)
  (:nicknames :blas))

(defpackage :msi.lapack
  (:use :cl :alexandria :msi.ffi-utils)
  (:nicknames :lapack))



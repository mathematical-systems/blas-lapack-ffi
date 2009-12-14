(defpackage :msi.blas-lapack.test
    (:use :cl :msi.ffi-utils :iterate :lift)
  (:export #:one-value
           #:make-random-array
           #:make-random-symmetric-matrix
           #:setup-array
           #:defcached
           #:reset-value
           #:~=
           #:coerce-to-double
           #:slice
           #:round-array
           #:transpose-list-array
           ))

(defpackage :msi.blas.test
    (:use :cl :msi.ffi-utils :msi.blas-lapack.test :msi.blas :iterate :lift))

(defpackage :msi.lapack.test
    (:use :cl :msi.ffi-utils :msi.blas-lapack.test :msi.lapack :iterate :lift))

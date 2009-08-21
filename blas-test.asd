;;;; TODO: add copyright and license

(asdf:defsystem blas-test
  :description "Testing programs for BLAS binding."
  :author "MSI"
  :version "0.1"
  :depends-on (:alexandria :iterate :blas :lift)
  :components
  ((:module test
	    :components ((:file "blas-test"))
	    :serial t
	    )))


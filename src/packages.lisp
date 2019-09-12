(defpackage #:magicl.foreign-libraries
  (:use #:common-lisp)
  (:export #:libgfortran
           #:libblas
           #:liblapack
           #:libexpokit
           #:foreign-symbol-available-p
           #:print-availability-report))

(defpackage #:magicl.cffi-types
  (:use #:common-lisp
        #:cffi)
  (:export #+sbcl #:array-pointer       ; FUNCTION
           #:with-array-pointers        ; MACRO
           #:complex-single-float
           #:complex-double-float
           #:fortran-int
           #:fortran-float
           #:fortran-double
           #:fortran-complex-float
           #:fortran-complex-double
           #:fortran-logical))

(defpackage #:magicl.blas-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:blas))

(defpackage #:magicl.lapack-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:lapack))

(defpackage #:magicl.expokit-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:expokit))

(defpackage #:magicl
  (:use #:common-lisp
        #:cffi
        #:abstract-classes)
  #+package-local-nicknames
  (:local-nicknames (#:blas #:magicl.blas-cffi)
                    (#:lapack #:magicl.lapack-cffi)
                    (#:expokit #:magicl.expokit-cffi))
  (:import-from #:magicl.foreign-libraries
                #:print-availability-report)
  (:shadow #:vector
           #:+
           #:-
           #:=
           #:map
           #:trace
           #:every
           #:some
           #:notevery
           #:notany)
  (:export #:*type-strictness*          ; VARIABLE
           #:S #:D #:C #:Z              ; SYMBOLS
           #:matrix                     ; TYPE, FUNCTION
           #:make-matrix                ; FUNCTION
           #:matrix-rows                ; READER
           #:matrix-cols                ; READER
           #:matrix-element-type        ; FUNCTION
           #:make-zero-matrix           ; FUNCTION
           #:square-matrix-p            ; FUNCTION
           #:identityp                  ; FUNCTION
           #:unitaryp                   ; FUNCTION
           #:map-indexes                ; FUNCTION
           #:tabulate                   ; FUNCTION
           #:make-identity-matrix       ; FUNCTION
           #:print-availability-report
           #:with-blapack
           #:make-complex-matrix
           #:make-complex-vector
           #:conjugate-entrywise
           #:transpose
           #:conjugate-transpose
           #:slice
           #:matrix-column
           #:matrix-row
           #:qr
           #:ql
           #:rq
           #:lq
           #:svd
           #:multiply-complex-matrices
           #:scale
           #:ref
           #:csd
           #:lapack-csd
           #:det
           #:inv
           #:dagger
           #:direct-sum
           #:diag
           #:matrix-diagonal
           #:eig
           #:hermitian-eig
           #:logm
           #:kron
           #:exptm
           #:inc-matrix
           #:dec-matrix
           #:add-matrix
           #:sub-matrix
           
           ;; New stuff

           ;; abstract-tensor protocol
           #:specialize-tensor
           #:generalize-tensor
           #:shape
           #:tref
           #:rank
           #:size
           #:element-type
           #:lisp-array

           ;; Classes
           #:tensor
           #:matrix

           ;; Accessors
           #:nrows
           #:ncols

           ;; Subtypes
           #:tensor/single-float
           #:tensor/double-float
           #:matrix/single-float
           #:matrix/double-float

           ;; Constructors
           #:make-tensor
           #:empty
           #:const
           #:rand
           #:deye
           #:arange
           #:from-array
           #:from-list

           ;; Operators
           #:+
           #:-
           #:@
           )

  ;; random.lisp
  (:export #:random-matrix              ; FUNCTION
           #:random-gaussian-matrix     ; FUNCTION
           #:random-unitary             ; FUNCTION
           ))

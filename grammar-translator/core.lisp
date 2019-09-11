(uiop:define-package :grammar-translator/core
    (:nicknames :core)
  (:use :common-lisp :alexandria)
  (:export #:translate))

(in-package :core)

(defvar )
(defgeneric translate (grammar to))

(defmethod translate (grammar (to (eql :ll1)))
  )

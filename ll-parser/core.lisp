(uiop:define-package :ll1-parser/core
    (:nicknames :core)
  (:use :common-lisp :alexandria)
  (:export #:parse
           #:make-grammar
           #:*grammar*
	   #:*grammar-entry*
	   #:*next-token*))

(in-package :core)


(defgeneric match (item)
  (:method ((item symbol))
    (match (or (gethash (funcall *next-token*)
			(gethash item *grammar*))
	       (error "parsing error at ~a" item))))
  (:method ((item string))
    (or (equal (funcall *next-token*) item)
	(error "parsing error at ~a" item)))
  (:method ((item list))
    (every #'match item)))

(defun parse ()
  (match *grammar-entry*)
  (when (funcall *next-token*)
    (error "parsing error at end")))

(uiop:define-package :grammar-utils/core
    (:nicknames :core)
  (:use :common-lisp :alexandria)
  (:export #:parse
           #:make-grammar
           #:*grammar*
	   #:*grammar-entry*
	   #:*next-token*))

(in-package :core)


(defvar *grammar*)
(defvar *next-token*)
(defvar *grammar-entry*)

(defun make-grammar (rules)
  "Rules are to be given as follows:
  (target ((<token-1> term-or-non-term*)
  	   (<token-2> term-or-non-term*)
  	   ...
  	   (<token-n> term-or-non-term*)))
  , where <token-i> != <token-j> is true for all  i = 1..n, j = 1..n; 
  "
  (let ((rules-ht (make-hash-table :test #'eq)))
    (dolist (rule rules)
      (setf (gethash (first rule) rules-ht)
	    (alexandria:alist-hash-table (second rule)
					 :test #'equal)))
    rules-ht))

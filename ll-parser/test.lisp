(in-package :cl-user) 

(uiop:define-package :ll1-parser/test
    (:use :common-lisp :alexandria
	  :ll1-parser/core))

(in-package :ll1-parser/test)

(defvar *test.1* '("a" "+" "b"))

(defun make-token-iterator (token-list)
  (let ((current token-list))
    (lambda ()
      (format t "token ~a taken" (first current))
      (prog1 (first current)
	(setf current (rest current))))))



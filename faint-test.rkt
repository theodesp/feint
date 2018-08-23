#lang racket/base
(require rackunit/text-ui)
(require rackunit "./faint.rkt")

(define faint-tests
  (test-suite
   "Tests for faint.rkt"

   (test-case
    "Throws error if not provided a parameter"
    (check-exn
     exn:fail?
     (lambda ()
       (feint))))

   (test-case
    "Throws error if not provided a function"
    (check-exn
     exn:fail?
     (lambda ()
       (feint 1))))

   (test-case
    "Ignores first call"
    (let ((feint-func (feint (lambda () '()))))
      (check-pred void? (feint-func))
      (check-eq? '() (feint-func))
     ))

   (test-case
    "Passes arguments to the function"
    (let ((feint-func (feint (lambda (args) args))))
      (check-pred void? (feint-func))
      (check-equal? '(1 2 3) (feint-func '(1 2 3)))
     ))
   ))

(run-tests faint-tests)

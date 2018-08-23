#lang racket
(require racket/provide)

(define (feint func)
  (if (false? (procedure? func))
      (error "Expected a function, but got something else!")
      (let ((called #f))

        (lambda args
          (if (false? called)
              (begin
                (set! called #t)
                (void))
              (apply func args))))))

(provide feint)

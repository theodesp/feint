# feint
Makes a function ignore it's first call

Example
--

```racket
#lang racket
(require "faint.rkt")

(define (1+ a)
  (+ a 1))
  
(define add1 (feint 1+) )
(add1 1) ; ignored
(add1 1) ; 2
(add1) ; Throws correctly
```

License
---
MIT License © 2018 Theo Despoudis

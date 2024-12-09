#lang racket
(require berkeley)

; Question 5
; A procedure which takes a function and a type checking predicate
; and returns a function analogous to type-check (type-check.rkt),
; which returns the result of the input passed into the function if
; the type is safe, or returns false if it's not safe.

(define (make-safe func pred?)
  (lambda (val)
    (if (pred? val)
        (func val)
        #f)))

(define safe-sqrt (make-safe sqrt number?))

(safe-sqrt 'hello)
(safe-sqrt 4)
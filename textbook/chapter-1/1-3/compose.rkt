#lang racket
(provide compose)

; Exercises 1.42
; Define a procedure that implements the composition
; of functions f and g

(define (compose f g)
  (lambda (x) (f (g x))))

((compose sqr add1) 6) ; 49
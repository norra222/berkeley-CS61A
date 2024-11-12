#lang racket

; Exercise 1.39
; Define a procedure that approximates the tangent function
; using Lambert's formula

; Note we can't use cont-frac (cont-frac.rkt) because of the minus
; in this equations denominator

(define (cont-frac n d k)
  (define (next n d k i)
    (if (> i k)
        1.0
        (/ (n i) (- (d i) (next n d k (+ i 1))))))
  (next n d k 1.0))

(define (tan x k)
  (define (n i)
    (if (> i 1) (* x x)
        x))
  (define (d i) (- (* i 2) 1))
  (cont-frac n d k))

(tan 1 10)             ; 1.557...
(tan (/ 3.14159 4) 10) ; 1.0
#lang racket

; Exercise 1.3
; Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

(define (square a) (* a a))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (sum-largest-squares a b c)
  (cond ((and (<= a b) (<= a c)) (sum-squares b c))
        ((and (<= b a) (<= b c)) (sum-squares a c))
        (else                    (sum-squares a b))))

(sum-largest-squares 1 2 3)    ; 13
(sum-largest-squares 99 98 97) ; 19405
(sum-largest-squares 17 42 31) ; 2725
        
#lang racket

; Exercise 1.7

(define (sqrt-iter guess prev x)
  (if (good-enough? guess prev)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess prev)
  (< (abs (/ (- guess prev) guess)) 0.001))

(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x) (sqrt-iter 1.0 0.0 x))

(sqrt 9)                 ; 3
(sqrt 0.000001)          ; 0.001
(sqrt 12345678987654333) ; 111,111,111

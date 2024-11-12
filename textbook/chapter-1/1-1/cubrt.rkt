#lang racket

; Exercise 1.8
; Define a procedure that takes in one argument and returns the cube root
; using Newton's method of approximate calculations, and ending when the change
; between iterations is a very small of a fraction of the guess.

(define (cubrt-iter guess prev x)
  (if (good-enough? guess prev)
      guess
      (cubrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess prev)
  (< (abs (/ (- guess prev) guess)) 0.001))

(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cubrt x) (cubrt-iter 1.0 0.0 x))

(cubrt 27)                ; 3
(cubrt 0.000001)          ; 0.01
(cubrt 12345678987654333) ; 231,120
#lang racket

(require "fixed-point.rkt")
; (fixed-point func first-guess)

(require "compose.rkt")
; (repeated func n-times)

(define (avg x y) (/ (+ x y) 2))

(define (avg-damp f) (lambda (x) (avg x (f x))))

; return x^y
(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))

; return a function which calcs the damped average for (n+1)th root of x
; i.e. if n=1 we are finding the sqrt
(define (smooth x n)
  (lambda (y) (avg y (/ x (pow y n)))))

(define (sqrt x)
  (fixed-point (smooth x 1) 1.0))
;(sqrt 2)

(define (cubrt x)
  (fixed-point (smooth x 2) 1.0))
;(cubrt 2)

(define (nth-rt x n)
  (fixed-point
    ((repeated avg-damp (floor (log n 2)))
      (lambda (y) (/ x (pow y (- n 1))))) 1.0))

(nth-rt 69.0 69)


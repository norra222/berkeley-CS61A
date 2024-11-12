#lang racket
(require "repeated.rkt")

; Exercise 1.44
; Write a procedure that takes as input a procedure that computes f
; and returns a procedure that computes the smoothed f

(define (smooth f)
  (let ((dx 0.1))
    (lambda (x)
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))

; nth smoothing i.e. call smooth n times using repeated (repeated.rkt)
(((repeated smooth 3) sin) 1.0) ; 0.833

      
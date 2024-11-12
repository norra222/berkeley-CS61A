#lang racket
(require "fixed-point.rkt" "repeated.rkt" "helpers.rkt")

; Exercise 1.45
; Define a procedure for computing nth roots using fixed-point (fixed-point.rkt),
; average-damp , and repeated (repeated.rkt)

(define (avg-damp f) (lambda (x) (avg x (f x))))

; From experiments, we can compute the minimal damp using a
; base 2 logarithm and the floor function to provide an integer

(define (nth-rt x n)
  (fixed-point
    ((repeated avg-damp (floor (log n 2)))
      (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(nth-rt 1000 5) ; 3.981

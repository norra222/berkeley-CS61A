#lang racket

; Exercise 1.41
; Define a procedure that takes as one argument a procedure and
; returns a procedure that applies the argument function twice

(define (double f)
  (lambda (x) (f (f x))))

((double add1) 0) ; applies the function twice -> 2

; (double double) returns a function that applies the input function 4 times

(((double double) add1) 0) ; applies the function 4 times -> 4

(((double (double double)) add1) 0) ; applies the function 16 times -> 16

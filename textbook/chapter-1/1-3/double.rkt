#lang racket

; Exercise 1.41

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(define (add-2 x) (+ x 2))

(((double (double double)) inc) 5)

(((double (double double)) add-2) 0)

; Double turns a function into one that applies the function twice.
; (double double) turns a function into one that applies the function 4 times.
; 
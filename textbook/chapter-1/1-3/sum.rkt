#lang racket
(require "helpers.rkt")

; Exercise 1.30
; Define a procedure that calculates the sum of the cubes of a to b.
; Make the summing procedure abstract to accept any term function.

(define (sum term next a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
   (iter a 0.0))

; Calculate the sum of cubes from 1 to 5
(sum cube add1 1 5) ; 225
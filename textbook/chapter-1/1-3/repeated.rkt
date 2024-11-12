#lang racket
(require "compose.rkt")
(provide repeated)

; Exercise 1.43
; Write a procedure that takes as inputs a procedure that computes f
; and a positive integer n and returns the procedure that computes
; the nth repeated application of f

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

((repeated sqr 2) 5) ; 625

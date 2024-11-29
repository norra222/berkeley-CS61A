#lang racket
(require test-engine/racket-tests)

; Exercise 1.16
; Procedure that takes inputs b and n and calculates b to the power
; n using an iterative process and based on example from the textbook.
; Also have an additional state variable a, and define a state
; transformation such that ab^n remains unchanged.

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter a (* b b) (/ n 2)))
          (else (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 b n))

(check-expect (fast-expt 2 3) 8)
(check-expect (fast-expt 9 7) 4782969)
(check-expect (fast-expt 100 0) 1)
(test)
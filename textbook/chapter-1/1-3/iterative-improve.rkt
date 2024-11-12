#lang racket
(require "helpers.rkt")

; Exercise 1.46
; Iterative improvement is an abstract form of numerical computation.
; We start with an initial guess for the answer, test if the guess is
; good enough, and otherwise improve the guess and continue the process
; using the improved guess as the new guess.

; Define a procedure which takes 2 functions as arguments: one to
; determine if a guess is good enough, and another to imrpove the guess.
; Return a procedure which takes a guess as input and keeps improving
; until the guess is good enough.

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve-guess guess))))
  (lambda (guess) (iter guess)))

; Write a procedure to calculate the square root using iterative improvement 

(define (square-root x)
  (define (improve guess)
    (avg guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (sqr guess) x)) 0.001))
  ((iterative-improve good-enough? improve) 1.0))

(square-root 9)  ; 3
(square-root 11) ; 3.3166

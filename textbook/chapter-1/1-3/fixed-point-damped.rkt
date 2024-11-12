#lang racket
(require "fixed-point.rkt")

; Exercise 1.36
; Modify fixed-point (see fixed-point.rkt) to print the sequence of guesses

(define (fixed-point-damped f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (/ (+ guess (f guess)) 2)))
;      (display next)(newline) ; optionally show each guess
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Compare the number of steps needed with an without average damping

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)        ; no damping, -> 35 guesses    
(fixed-point-damped (lambda (x) (/ (log 1000) (log x))) 2.0) ; inc damping -> 10 gueses

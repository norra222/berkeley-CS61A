#lang racket

; Exercise 1.36

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
;    (let ((next (f guess)))                 ; No average damping
    (let ((next (/ (+ guess (f guess)) 2))) ; Average damping
      (display next)(newline)               ; Print guess
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

; Without average damping -> 35 guesses
; With average damping    -> 10 guesses

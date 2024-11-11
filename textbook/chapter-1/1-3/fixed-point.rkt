#lang racket

(provide fixed-point)

; Exercise 1.35

(define tolerance 0.0000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (writeln next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Golden ratio
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0) ; 1.6180...




    
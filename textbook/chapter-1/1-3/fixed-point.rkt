#lang racket
(provide fixed-point tolerance)

; Exercise 1.35
; Compute the golden ratio using a fixed-point procedure

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
;      (display next)(newline) ; optionally show each guess
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Golden ratio
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0) ; 1.6180...

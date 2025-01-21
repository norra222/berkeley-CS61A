#lang racket
(provide make-rat numer denom print-rat)

; Procedures for defining a rational number using a numerator
; and a denominator, simplifying the fraction if there is a
; common denominator and normalising the signs if required.
; The two values are assigned in a "pair" construct and accessed
; using the "car" and "cdr" built-in procedures.
; A print function is also defined for printing the rational number
; as a fraction to output.

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (abs (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


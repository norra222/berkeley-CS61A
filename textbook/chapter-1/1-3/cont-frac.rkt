#lang racket

; Exercise 1.37, 1.38

; n and d are procedures for finding the i'th term Ni and Di
; k is the detpth of truncation
(define (cont-frac n d k)
  (define (next n d k i)
    (if (> i k)
        1.0
        (/ (n i) (+ (d i) (next n d k (+ i 1))))))
  (next n d k 1.0))

; Golden ratio
;(/ 1.0 (cont-frac (lambda (i) 1.0 (lambda (i) 1.0) 11))
; After 10 attempts, its accurate to 4 d.p


; Eulers expansion
(define (euler-d i)
  (if (= (modulo (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2)
      1))
(+ 2 (cont-frac (lambda (n) 1) euler-d 100))
      

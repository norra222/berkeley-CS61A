#lang racket
(require "cont-frac.rkt")

; Exercise 1.38
; Write a program that uses cont-frac (cont-frac.rkt) to approximate
; Euler's Number (e), based on Euler's expansion

(define (d i)
  (if (= (modulo (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2)
      1))

(+ 2 (cont-frac (lambda (n) 1) d 100)) ; e (2.71828)
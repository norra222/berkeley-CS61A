#lang racket
(provide cube avg)

; Helper functions that can be imported into any other module for reuse

(define (cube x) (* x x x))

(define (avg x y) (/ (+ x y) 2))
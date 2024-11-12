#lang racket
(provide cont-frac)

; Exercise 1.37
; Define a procedure for computing the value of the
; k-term finite continues fraction

; Recursive implementation
(define (cont-frac n d k)
  (define (next n d k i)
    (if (> i k)
        1.0
        (/ (n i) (+ (d i) (next n d k (+ i 1))))))
  (next n d k 1.0))

; Test by approximating golden ratio
(/ 1.0 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 15)) ; 1.6180...

; Iterative implementation
(define (cont-frac-iter n d k)
  (define (iter i res)
    (if (= i 0) res
        (iter (sub1 i) (/ (n i) (+ (d i) res)))))
  (iter (sub1 k) (/ (n k) (d k))))  

; Test by approximating golden ratio
(/ 1.0 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 15)) ; 1.6180...

#lang racket

; Exercise 1.31
; Define a procedure product that returns the product of a sequence
; using abstraction to pass in any terms, increments and ranges

(define (product term next a b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (* (term a) result))))
  (iter a 1.0))

; Use the abstract product procedure to define a procedure for
; calculating the factorial of an input

(define (fact a)
  (product identity add1 1 a))

(fact 5) ; 120
(fact 7) ; 5040

; Use the abstract product procedure to define a procedure for
; estimating pi using the Wallis Product

(define (wallis-term n)
  (/ (* 4 n n) (- (* 4 n n) 1)))

(define (wallis-product n)
  (product wallis-term add1 1 n))

(* (wallis-product 100) 2) ; pi (3.14159)

; Part 2
; The product procedure uses an inerative approach,
; define one that uses a resursive approach

(define (product-rec term next a b)
  (define (iter a)
    (if (> a b) 1.0
        (* (term a) (iter (next a)))))
  (iter a))

; Define another factorial procedure,
; this time using the recursive approach

(define (fact-rec a)
  (product-rec identity add1 1 a))

(fact-rec 5) ; 120
(fact-rec 7) ; 5040
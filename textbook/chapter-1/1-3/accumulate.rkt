#lang racket
(require "helpers.rkt")

; Exercise 1.32
; Define a general procedure that combines a collection of terms,
; using some general accumulation function. It takes as arguments
; the same term and range variables as sum and product (see sum.rkt
; and product.rkt), together with a combiner procedure that specifies
; how the current term is to be combined with the accumulating of
; the proceding terms and a null-value to specifiy what value to
; use when the terms run out.

; RECURSIVE IMPLEMENTATION
(define (accum combiner null f next a b)
  (if (> a b)
      null
      (combiner (f a)
                (accum combiner null f next (next a) b))))

; Define sum and product using the abstract accum procedure
(define (sum f next a b)
  (accum + 0 f next a b))

(define (product f next a b)
  (accum * 1 f next a b))

; Test sum using cube function
(define (sum-cube a b)
  (sum cube add1 a b))

(sum-cube 1 5) ; 225

; Test product using factorial function
(define (fact a)
  (product identity add1 1 a))

(fact 7) ; 5040


; ITERATIVE IMPLEMENTATION
(define (accum-iter combiner null f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (f a)))))
  (iter a null))
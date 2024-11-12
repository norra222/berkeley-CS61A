#lang racket
(require math)

; Exercise 1.33
; Produce an even more abstract version of accumulate (see accumulate.rkt)
; that includes a filter of which terms to combine. The procedure takes
; the same arguments as accumulate, along with an additional predicate
; that specifies the filter to apply.

(define (filter-accum pred? combiner null f next a b)
  (if (pred? a)
      (if (> a b)
          null
          (combiner (f a)
                (filter-accum pred? combiner null f next (next a) b)))
      (filter-accum pred? combiner null f next (next a) b)))

; Procedure that calculates the sum of the squares of the
; prime numbers between a and b

(define (sum-prime-squares a b)
  (filter-accum prime? + 0 sqr add1 a b))

(sum-prime-squares 1 10) ; 87

; Procedure that calculates the product of all positive integers less
; than n that are co-prime (relatively prime) to n

(define (product-coprimes n)
  (define (n-coprime? a)
    (coprime? a n))
  (filter-accum n-coprime? * 1 identity add1 1 (- n 1)))

(product-coprimes 5) ; 24


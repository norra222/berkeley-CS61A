#lang racket

; Exercise 1.33

(define (filter-accum pred? combiner null f a next b)
  (if (pred? a)
      (if (> a b)
          null
          (combiner (f a)
                (filter-accum pred? combiner null f (next a) next b)))
      (filter-accum pred? combiner null f (next a) next b)))

(define (true? a) #t) ; Just returns true

(define (iter x) (+ x 1))
(define (identity x) x)

(filter-accum true? + 0 identity 0 iter 10) ; 55

; 1. Assuming prime? pred exists
(filer-accum prime? + 0 square a iter b) ; Won't work because of undefines

; 2. Assume relativePrime? exists
(filter-accum relativePrime? * 1 identity 0 iter n) ; Won't work

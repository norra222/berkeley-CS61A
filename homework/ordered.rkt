#lang racket
(require berkeley)

(define (ordered? nums)
  (if (empty? (bf nums))
      #t
      (and (<= (first nums) (first (bf nums))) (ordered? (bf nums)))))

(ordered? '(1 100 101 103 1000 100000 100))
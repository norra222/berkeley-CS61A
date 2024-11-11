#lang racket
(require berkeley)

(define (square x) (* x x))
(define numbers '(10 11 12 13 14 15 16 17 18 19 20))

(define (squares s)
  (if (empty? s)
      '()
      (sentence (square(first s)) (squares (bf s)))))

(squares numbers)


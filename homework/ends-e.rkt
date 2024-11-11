#lang racket
(require berkeley)

(define (ends-e s)
  (if (not (empty? s))
      (if (equal? (last (first s)) 'e)
          (sentence (first s) (ends-e (bf s)))
          (ends-e (bf s)))
      s))

(ends-e '(please put the salami above the blue elephant))
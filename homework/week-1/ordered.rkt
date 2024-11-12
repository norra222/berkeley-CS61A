#lang racket
(require berkeley test-engine/racket-tests)

; A predicate that takes a sentence of numbers as input and returns a
; true value if the numbers are in asceding order and a false if not

(define (ordered? nums)
  (if (empty? (bf nums))
      #t
      (and (<= (first nums) (first (bf nums))) (ordered? (bf nums)))))

(check-expect (ordered? '(1 100 101 103 1000 100000 100)) #f)
(check-expect (ordered? '(1 2 3 4 5)) #t)
(check-expect (ordered? '(10 20 29 48 284 0)) #f)
(test)
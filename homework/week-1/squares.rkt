#lang racket
(require berkeley test-engine/racket-tests)

; A procedure which takes a sentence of numbers as input
; and returns a sentence of the square of the numbers

(define numbers '(2 3 4 5))
(define more-numbers '(10 11 12 13 14 15 16 17 18 19 20))

(define (squares s)
  (if (empty? s)
      '()
      (sentence (sqr (first s)) (squares (bf s)))))

(check-expect (squares numbers) '(4 9 16 25))
(check-expect (squares more-numbers) '(100 121 144 169 196 225 256 289 324 361 400))
(check-expect (squares '()) '())
(test)

#lang racket
(require berkeley test-engine/racket-tests)

; Abstract procedure that takes in a function and a sentence
; and applies the input function to every word in the sentence
; and returns the modified sentence

(define (every f s)
  (if (equal? s '())
      s
      (sentence (f (first s)) (every f (bf s)))))

(check-expect (every sqr '(1 2 3 4))
              '(1 4 9 16))
(check-expect (every first '(nowhere man))
              '(n m))
(test)
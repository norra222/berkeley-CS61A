#lang racket
(require berkeley test-engine/racket-tests)

; A procedure that takes a sentence as input a returns a sentence
; containing only the words of the input whose last letter is 'e'

(define (ends-e s)
  (if (not (empty? s))
      (if (equal? (last (first s)) 'e)
          (sentence (first s) (ends-e (bf s)))
          (ends-e (bf s)))
      s))

(check-expect (ends-e '(please put the salami above the blue elephant))
              '(please the above the blue))
(check-expect (ends-e '(the true glue be blue))
              '(the true glue be blue))
(check-expect (ends-e '(nothing to check except me))
              '(me))
(test)
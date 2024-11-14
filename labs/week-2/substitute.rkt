#lang racket
(require berkeley test-engine/racket-tests)

; Procedure that takes three arguments; a sentence an old word,
; and a new word and returns a copy of the sentence with every
; occurence of the old word replaced by the new word

(define (sub s old-word new-word)
  (if (empty? s)
      s
      (if (equal? (first s) old-word)
          (sentence new-word (sub (bf s) old-word new-word))
          (sentence (first s) (sub (bf s) old-word new-word)))))

(check-expect (sub '(hello) 'hello 'goodbye)
              '(goodbye))
(check-expect (sub '(she loves you yeah yeah yeah) 'yeah 'maybe)
              '(she loves you maybe maybe maybe))
(check-expect (sub '(nothing to change here) 'something 'else)
              '(nothing to change here))
(test)

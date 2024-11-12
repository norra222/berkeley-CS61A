#lang racket
(require berkeley test-engine/racket-tests)

; A procedure that takes a sentence as input and returns a sentence
; where every instance of the words 'i' and 'me' are replced by 'you'
; and every instance of 'you' is replaced by 'me', except at the
; beginning of a sentence, where it's replaced by 'i'

(define (switch s)
  (if (empty? (bl s))
      (cond ((equal? (last s) 'you) 'i)
            ((or (equal? (last s) 'me) (equal? (last s) 'i)) 'you)
            (else (last s)))
      (cond ((equal? (last s) 'you) (sentence (switch (bl s)) 'me))
             ((or (equal? (last s) 'me) (equal? (last s) 'i)) (sentence (switch (bl s)) 'you))
             (else (sentence (switch (bl s)) (last s))))))
              
(check-expect (switch '(you told me that i should wake you up))
              '(i told you that you should wake me up))
(check-expect (switch '(i think of you and that makes me think of you and me))
              '(you think of me and that makes you think of me and you))
(check-expect (switch '(nothing to switch))
              '(nothing to switch))
(test)

  
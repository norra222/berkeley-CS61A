#lang racket
(require berkeley)

#|
Get the butlast of the sentence
If butlast is empty (meaning we are at the start of the sentence),
check the final word and if it's 'you' swap to 'i'
Else sentece ('switch' with butlast) and the last work,
after swapping and 'you', 'me', or 'i'.
|#


(define (switch s)
  (if (empty? (bl s))
      (cond ((equal? (last s) 'you) 'i)
            ((or (equal? (last s) 'me) (equal? (last s) 'i)) 'you)
            (else (last s)))
      (cond ((equal? (last s) 'you) (sentence (switch (bl s)) 'me))
             ((or (equal? (last s) 'me) (equal? (last s) 'i)) (sentence (switch (bl s)) 'you))
             (else (sentence (switch (bl s)) (last s))))))
              
      
(switch '(i think of you and that makes me think of you and me))

  
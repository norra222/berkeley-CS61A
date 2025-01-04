#lang racket
(require berkeley)
(provide best-total)

; Part 1
; Complete the game twenty-one (twenty-one.rkt) by providing the best-total
; procedure. best-total takes a hand (a sentenc of card words) as input,
; and returns the total number of points in the hand i.e. the largest
; possible that's less than or equal to 21.

(define (best-total start-hand)
  (define (next total hand)
    (cond ((empty? hand) total)
          ((equal? (card-value (first hand)) 'A)
           (if (bust? (next (+ total 11) (bf hand)))
               (next (+ total 1) (bf hand))
               (next (+ total 11) (bf hand))))
          (else (next (+ total (card-value (first hand))) (bf hand)))))
  (next 0 (sentence start-hand)))

(define (card-value card)
  (let ((val (bl card)))
    (cond ((equal? val 'A) 'A)
          ((member? val '(J Q K)) 10)
          (else val))))

(define (bust? total)
  (> total 21))


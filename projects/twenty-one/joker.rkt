#lang racket
(require berkeley)

; Part 10
; Change the rules of blackjack by adding 2 jokers to the deck. A joker
; can be worth any number of points from 1 to 11.


; Procedure used to find the best total value of a hand including aces
; and jokers. Taken from "best-total.rkt" and adapted to use jokers.

(define (best-total start-hand)
  (define (next total hand)
    (cond ((empty? hand) total)
          ((equal? (card-value (first hand)) 'A)
           (if (bust? (next (+ total 11) (bf hand)))
               (next (+ total 1) (bf hand))
               (next (+ total 11) (bf hand))))
          ((equal? (card-value (first hand)) 'X)
           (next (+ total (best-joker-value hand)) (bf hand)))
          (else (next (+ total (card-value (first hand))) (bf hand)))))
  (next 0 (sentence start-hand)))


; Procedure to find the best joker value in a hand by starting with a
; value of 11 then testing whether that hand is bust - if it is, then try
; a lower joker value, if it's not then use that value

(define (best-joker-value hand)
  (define (try-val val)
    (if (= val 1)
        1
        (if (bust? (+ val (best-total (bf hand))))
            (try-val (- val 1))
            val)))
  (try-val 11))


(define (card-value card)
  (let ((val (bl card)))
    (cond ((equal? val 'A) 'A)
          ((equal? val 'X) 'X)
          ((member? val '(J Q K)) 10)
          (else val))))


(define (bust? total)
  (> total 21))


; Play a game of blackjack with the new joker rules

(define (joker-twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
                          (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))
  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )


; Make a deck including 2 jokers, which are represented as X1 and X2

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C) 'X1 'X2) )

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 54))


; Strategy to stop at 17, otherwise take another card

(define (stop-at-17 customer-hand dealer-hand)
  (if (< (best-total customer-hand) 17)
      #t
      #f))


; Play a game of joker twenty-one

(joker-twenty-one stop-at-17)
#lang racket
(require berkeley "best-total.rkt")
(provide stop-at-17 dealer-sensitive stop-at-20 valentine majority-strat reckless-17)

; Strategies that can be used in blackjack, covering Parts 2, 4, 5, 6, 7, 8 and 9

; Part 2
; Takes a card if the total is less than 17, otherwise stick

(define (stop-at-17 customer-hand dealer-hand)
  (if (< (best-total customer-hand) 17)
      #t
      #f))


; Part 4
; Takes a card if the dealer has an ace, 7, 8, 9, 10 or picture card showing and
; the customer has less than 17, or the dealer has a 2, 3, 4, 5, 6 showing and
; the customer has less than 12

(define (dealer-sensitive customer-hand dealer-hand)
  (if (and (< (best-total customer-hand) 17)
           (>= (best-total dealer-hand) 7))
      #t
      #f))


; Part 5
; Return a starategy that keeps hitting until the hand's total is n or more

(define (stop-at n)
  (lambda (customer-hand dealer-hand)
    (if (< (best-total customer-hand) n)
        #t
        #f)))

(define stop-at-20 (stop-at 20))


; Part 7
; Take 2 strategies and a suit as input and return a strategy where if the player
; hand contains a card of the given suit play the first strategy, otherwise play
; the second strategy.

(define (contains-suit? suit hand)
    (if (empty? hand)
      #f
      (or (equal? (last (first hand)) suit) (contains-suit? suit (bf hand)))))

(define (suit-strategy suit contains-suit-strat normal-strat)
  (lambda (customer-hand dealer-hand)
    (if (contains-suit? suit customer-hand)
        (contains-suit-strat customer-hand dealer-hand)
        (normal-strat customer-hand dealer-hand))))


; Part 6
; If you win with a heart in your hand, the casino pays double. Stop a 17 unless
; you have a heart in your hand, in which case stop at 19

(define valentine (suit-strategy 'H (stop-at 19) (stop-at 17)))


; Part 8
; Take 3 strategies as input and return a strategy that takes another card if at
; least 2 of the 3 input strategies decide to take a card, otherwise stick.

(define (majority strat-1 strat-2 strat-3)
  (lambda (c-hand d-hand)
    (if (or (and (strat-1 c-hand d-hand) (strat-2 c-hand d-hand))
            (and (strat-1 c-hand d-hand) (strat-3 c-hand d-hand))
            (and (strat-2 c-hand d-hand) (strat-3 c-hand d-hand)))
        #t
        #f)))

(define majority-strat (majority valentine stop-at-17 dealer-sensitive))


; Part 9
; Takes in a strategy and returns a new starategy that always takes 1 more card
; than the input strategy would

(define (reckless strat)
  (lambda (c-hand d-hand)
    (if (strat (bl c-hand) d-hand)
        #t
        #f)))

(define reckless-17 (reckless stop-at-17))



       
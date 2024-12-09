#lang racket

; Question 1
; Implement the count change procedure from textbook
; but reverse it so the smallest coins are tested first.
; Start with just 1 coin, and the increase the kinds-of-coins
; up to 5

(define (count-change amount)
  (cc amount 1))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 6)) 0)
        (else (+ (cc amount
                     (+ kinds-of-coins 1))
                 (cc (- amount (coins kinds-of-coins))
                     kinds-of-coins)))))

; Another way to reverse the precedure is to reverse
; the order of coins in this procedure
(define (coins n)
  (cond ((= n 1) 1)
        ((= n 2) 5)
        ((= n 3) 10)
        ((= n 4) 25)
        ((= n 5) 50)))

(count-change 100)
        
#lang racket
(require berkeley)

; Question 3
; Change the kinds-of-coins from the original, to be a
; sentence containing coin values

(define (count-change amount)
  (cc amount '(50 25 10 5 1)))

(define (cc amount coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (empty? coins)) 0)
        (else (+ (cc amount (bf coins))
                 (cc (- amount (first coins)) coins)))))

(count-change 100)
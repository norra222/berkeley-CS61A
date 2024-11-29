#lang racket
(require test-engine/racket-tests)

; Exercise 1.27
; A procedure that takes an integer n and tests whether
; a^n is congruent to a modulo n for every a < n (i.e. it passes
; the fermat test for all valid values of a), use this
; to show that the Carmichael numbers can fool the Fermat test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (modulo (sqr (expmod base (/ exp 2) m)) m))
        (else (modulo (* base (expmod base (- exp 1) m)) m))))

(define (test-num n)
  (define (test-iter n a)
    (cond ((= a 0) #t)
          ((= (expmod a n n) a) (test-iter n (- a 1)))
          (else #f)))
  (test-iter n (- n 1)))

(check-expect (test-num 7) #t)
(check-expect (test-num 9) #f)
(check-expect (test-num 1999) #t)

; Carmichael numbers
(check-expect (test-num 561) #t)
(check-expect (test-num 1105) #t)
(check-expect (test-num 1729) #t)
(check-expect (test-num 2465) #t)
(check-expect (test-num 2821) #t)
(check-expect (test-num 6601) #t)
(test)
  
  
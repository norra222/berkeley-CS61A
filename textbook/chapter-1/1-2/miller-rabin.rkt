#lang racket
(require test-engine/racket-tests)

; Exercise 1.28
; Procedure for performing the Miller-Rabin prime test, which
; starts with an alternative form of Fermat's Little Theorem,
; and also performs an extra check in expmod. This procedure is
; not fooled by the Carmichael numbers.
; For more information on the theory see textbook

(define (expmod base exp n)
  (cond ((= exp 0) 1)
        ((and (= base (- n 1)) (= base 1) (= (modulo (sqr exp) n) 1)) 0)
        ((even? exp) (modulo (sqr (expmod base (/ exp 2) n)) n))
        (else (modulo (* base (expmod base (- exp 1) n)) n))))

(define (miller-rabin-test n a)
  (define result (expmod a (- n 1) n))  
  (if (= result 0)
      #f
      (= result 1)))

(define (test-num n)
  (define (test-iter n a)
    (cond ((= a 0) #t)
          ((miller-rabin-test n a) (test-iter n (- a 1)))
          (else #f)))
  (test-iter n (- n 1)))

(check-expect (test-num 7) #t)
(check-expect (test-num 9) #f)
(check-expect (test-num 1999) #t)
(check-expect (test-num 19999) #f)

; Carmichael numbers
(check-expect (test-num 561) #f)
(check-expect (test-num 1105) #f)
(check-expect (test-num 1729) #f)
(check-expect (test-num 2465) #f)
(check-expect (test-num 2821) #f)
(check-expect (test-num 6601) #f)
(test)
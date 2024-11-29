#lang racket
(require test-engine/racket-tests)
(provide prime? prime-fast?)

; Exercise 1.21, 1.23
; Procedure to find prime numbers by finding the smallest divisor
; for a given input. If the smallest divisor it itself, then it
; is prime. Procedure starts by trying to divide by 2 and increases
; the divisor by 1 each iteration, until either a divisor is found,
; or the stopping criteria is reached

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (modulo a b) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(check-expect (prime? 199) #t)
(check-expect (prime? 1999) #t)
(check-expect (prime? 19999) #f)

; More efficient procedure for finding the next divisor to test,
; reducing redundant tests like 4 when 2 has already been tested.
(define (find-divisor-fast n test-divisor)
  (define (next x)
    (if (= x 2)
        3
        (+ x 2)))
  (cond ((> (sqr test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor-fast n (next test-divisor)))))

(define (prime-fast? n)
  (= (find-divisor-fast n 2) n))

(check-expect (prime-fast? 199) #t)
(check-expect (prime-fast? 1999) #t)
(check-expect (prime-fast? 19999) #f)
(test)

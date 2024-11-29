#lang racket

; Exercise 1.24
; Apadtation of "search-for-primes.rkt" but using Fermats
; method of determining whether a number is prime

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (modulo (sqr (expmod base (/ exp 2) m)) m))
        (else (modulo (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try a)
    (= (expmod a n n) a))
  (try (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (prime? n 100)
        (report-prime n (- (current-inexact-milliseconds) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " (found in ")
  (display elapsed-time)
  (display " ms)")
  (newline))

(define (search-for-primes-fast start end)
  (define (next n)
    (timed-prime-test n)
    (when (<= (+ n 2) end) (next (+ n 2))))
  (if (even? start)
      (next (+ start 1))
      (next start)))

(search-for-primes-fast 1000000000 1000000100)


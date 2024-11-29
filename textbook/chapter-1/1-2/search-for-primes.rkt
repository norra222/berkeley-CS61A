#lang racket
(require "smallest-divisor.rkt")

; Exercise 1.22
; Procedure which checks for the primality of odd inegers in
; a given range, using the prime? procedure (smallest-divisor.rkt)
; Outputs the time needed to find each prime number.

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (prime? n)
        (report-prime n (- (current-inexact-milliseconds) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " (found in ")
  (display elapsed-time)
  (display " ms)")
  (newline))

(define (search-for-primes start end)
  (define (next n)
    (timed-prime-test n)
    (when (<= (+ n 2) end) (next (+ n 2))))
  (if (even? start)
      (next (+ start 1))
      (next start)))

(search-for-primes 1000000000 1000000100)


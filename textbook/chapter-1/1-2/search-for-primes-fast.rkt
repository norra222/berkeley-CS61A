#lang racket
(require "smallest-divisor.rkt")

; Exercise 1.24
; Adaptation of "search-for-primes.rkt" but using prime-fast
; from "smallest-divisor.rkt" which uses the Fermat method

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (prime-fast? n)
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

(search-for-primes-fast 1000000 1000100)


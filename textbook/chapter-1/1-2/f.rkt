#lang racket
(require test-engine/racket-tests racket/trace)

; Exercise 1.11
; Procedure that computes f where f is given by:
; f(n) = n                          if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

; Recursive
; Note: this takes a very long time to run for larger n
(define (f-rec n)
  (if (< n 3) n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

; Iterative
(define (f-iter n)
  (define (iter c f-1 f-2 f-3 n)
    (if (= c n) (+ f-1 (* 2 f-2) (* 3 f-3))
        (iter (+ c 1)
              (+ f-1 (* 2 f-2) (* 3 f-3))
              f-1
              f-2
              n)))
  (if (< n 3) n
      (iter 3 2 1 0 n)))

(check-expect (f-rec 5) 25)
(check-expect (f-rec 10) 1892)
(check-expect (f-iter 5) 25)
(check-expect (f-iter 10) 1892)
(test)

#lang racket

; 1.18

(define (fast-mult-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-mult-iter (double a) (halve b) c))
        (else (fast-mult-iter a (- b 1) (+ c a)))))

(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? n) (= (remainder n 2) 0))

(fast-mult-iter 17 19 0)
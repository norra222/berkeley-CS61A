#lang racket
(require test-engine/racket-tests)

; Exercise 1.17, 1.18
; Procedure which performs multiplication analogous to
; fast-expt (fast-expt.rkt). Assume the only operations
; available are addition, double and half.

; recursive implementation
(define (fast-mult-rec a b)
  (cond ((= b 1) a)
        ((= b 0) 0)
        ((even? b) (fast-mult-rec (double a) (halve b)))
        (else (+ a (fast-mult-rec a (- b 1))))))

; iterative implementation
(define (fast-mult-iter a b)
  (define (iter a b c)
    (cond ((= b 0) c)
          ((even? b) (iter (double a) (halve b) c))
          (else (iter a (- b 1) (+ c a)))))
  (iter a b 0))

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(check-expect (fast-mult-rec 5 5) 25)
(check-expect (fast-mult-rec 49 312) 15288)
(check-expect (fast-mult-rec 1 0) 0)
(check-expect (fast-mult-iter 5 5) 25)
(check-expect (fast-mult-iter 49 312) 15288)
(check-expect (fast-mult-iter 1 0) 0)
(test)
#lang racket
(require racket/trace)

; 1.16 - Fast Exponential Iteration
; Include tracing 

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (* b b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (even? n) (= (remainder n 2) 0))

(trace fast-expt-iter)
(fast-expt-iter 1 9 7)
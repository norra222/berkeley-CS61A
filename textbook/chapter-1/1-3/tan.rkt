#lang racket

; Exercise 1.39
; Tangent function
(define (tan-cf x k)
  (define (next k i)
    (if (> i k)
        1.0
        (/ (if (> i 1)
               (* x x)
               x)
           (- (- (* i 2) 1)
              (next k (+ i 1))))))
  (next k 1))

(tan-cf (/ 3.1415926 2) 10)
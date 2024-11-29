#lang racket
(require test-engine/racket-tests)

; Extra for Experts
; Procedure to compute the number of partitions of a non-negative
; integer

(define (number-of-partitions num)
  (iter num num))
  
(define (iter num largest-num)
  (cond ((= num 0) 1)
        ((or (< num 0) (= largest-num 0)) 0)
        (else (+ (iter num (- largest-num 1))
                 (iter (- num largest-num) largest-num)))))

(check-expect (number-of-partitions 1) 1)
(check-expect (number-of-partitions 5) 7)
(check-expect (number-of-partitions 10) 42)
(test)

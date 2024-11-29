#lang racket
(require test-engine/racket-tests)

; Question 2
; Procedure that takes an input and returns the next perfect number after it
; A perfect number is a number equal to the sum of it's factors
; e.g. 6 = 1 + 2 + 3

(define (next-perfect-num n)
  (if (perfect-num? n)
      n
      (next-perfect-num (+ n 1))))

(define (perfect-num? n)
  (= (sum-of-factors n) n))

(define (sum-of-factors n)
  (define (iter sum n a)
    (if (= n a)
        sum
        (if (= (modulo n a) 0)
            (iter (+ sum a) n (+ a 1))
            (iter sum n (+ a 1)))))
  (iter 0 n 1))

(check-expect (next-perfect-num 1) 6)
(check-expect (next-perfect-num 7) 28)
(check-expect (next-perfect-num 29) 496)
(test)
        
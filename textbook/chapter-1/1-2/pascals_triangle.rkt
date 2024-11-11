#lang racket

; 1.12 - Pascal's Triangle

; Return element at position n on row r
(define (tri r n)
  (if (or (= n 1) (= n r)) 1
      (+ (tri (- r 1) (- n 1))
         (tri (- r 1) n))))

(tri 5 3)
      
  
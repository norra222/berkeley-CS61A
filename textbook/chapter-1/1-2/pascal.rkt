#lang racket
(require test-engine/racket-tests)

; Exercise 1.12
; Procedure that take two arguments; a row and an index
; and returns the element in Pascal's Triangle at that
; location

(define (tri r n)
  (if (or (= n 1) (= n r)) 1
      (+ (tri (- r 1) (- n 1))
         (tri (- r 1) n))))

(check-expect (tri 5 3) 6)
(check-expect (tri 2 1) 1)
(check-expect (tri 101 5) 3921225)
(test)

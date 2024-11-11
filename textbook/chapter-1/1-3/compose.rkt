#lang racket

(provide repeated)

; Exercises 1.42, 1.43

; 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

; 1.43
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

;((compose square inc) 6) ; 49
;((repeated square 2) 5) ; 625
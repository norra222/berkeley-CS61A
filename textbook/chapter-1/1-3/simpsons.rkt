#lang racket
(require "helpers.rkt")

; Exercise 1.29
; Define a procedure that takes in a function f and values a, b and n
; and returns the integral of f between a and b using Simpson's Rule.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (/ h 3)
     (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f a add-2h b))
        (f b))))

; Use the procedure to integrate 'cube' function between 0 and 1.

(simpson cube 0 1.0 1000) ; 0.25
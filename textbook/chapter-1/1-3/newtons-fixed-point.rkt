#lang racket

(provide fixed-point)

; Exercise 1.40

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

; All procedures below are from chapter 1.3
; Don't ask how they work!

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define dx 0.00001)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; (newtons-method (cubic 3 -6 -8) -10)





  
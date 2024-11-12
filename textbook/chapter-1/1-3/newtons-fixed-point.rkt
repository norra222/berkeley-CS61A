#lang racket
(provide fixed-point)

; Exercise 1.40
; Define a procedure that approximates zeros of a cubic equation
; using Newton's Method (see Textbook 1.3.4)

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

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

; Cubic equation to evaluate (x^3 + ax^2 + bx + c)
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

(newtons-method (cubic 1 1 1) 1)   ; -1
(newtons-method (cubic 3 -6 -8) 1) ; 2
(newtons-method (cubic 10 9 8) 1)  ; -9.1083
  
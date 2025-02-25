#lang racket
(provide make-point x-point y-point distance-point)

; Helpers
; Rectangles can be defined using points, so create some helper functions
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (distance-point p1 p2)
  (sqrt (+ (sqr (- (x-point p1) (x-point p2)))
           (sqr (- (y-point p1) (y-point p2))))))
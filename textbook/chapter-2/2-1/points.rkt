#lang racket

; Exercise 2.2

; Constructor for a line segment, made up of a start and end point
(define (make-segment start end)
  (cons start end))

; Selectors for the start and end points of a segment
(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; Constructor for a point, made up of an x and y value
(define (make-point x y)
  (cons x y))

; Selectors for the x and y value of a point
(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

; Procedure to find the midpoint of a given line segment, by accessing the start
; and end points, and then averaging the x values and y values respectively,
; returning the midpoint as a new point
(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
              (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))

; Procedure for printing points
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Find the midpoint of (1,2) and (5,6)
(define p1 (make-point 1 2))
(define p2 (make-point 5 6))
(define seg (make-segment p1 p2))
(define mid (midpoint-segment seg))
(print-point mid) ; (3,4)
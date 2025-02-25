#lang racket
(require "rectangle-helpers.rkt")
(provide rect rect-height rect-width)

; Exercise 2.3
; Second Implementation
; Represent the rectangle as 3 corners, with a contsraint that the angle between them
; is a right-angle. This constraint makes the constructor more complex as we need
; to check for orthogonality. Store the second and third point in a pair, and store this
; in another pair containing the first point.

(define (make-rect p1 p2 p3)
  (if (orthogonal? (sub-vector p2 p1) (sub-vector p3 p1))
      (cons p1 (cons p2 p3))
      (error "Points should make a rectangle")))

(define (rect-height rect) (distance-point (rect-p1 rect) (rect-p2 rect)))
(define (rect-width rect) (distance-point (rect-p1 rect) (rect-p3 rect)))

(define (rect-p1 rect) (car rect))
(define (rect-p2 rect) (car (cdr rect)))
(define (rect-p3 rect) (cdr (cdr rect)))

; Helpers
(define (dot-product p1 p2)
  (+ (* (x-point p1) (x-point p2))
     (* (y-point p1) (y-point p2))))

(define (sub-vector v1 v2)
  (make-point (- (x-point v1) (x-point v2))
              (- (y-point v1) (y-point v2))))

(define (orthogonal? v1 v2)
  (= 0.0 (dot-product v1 v2)))

; Create a rectangle using this implementation for testing
(define p1 (make-point 0 0))
(define p2 (make-point 10 -2))
(define p3 (make-point 1 5))

(define rect (make-rect p1 p2 p3))

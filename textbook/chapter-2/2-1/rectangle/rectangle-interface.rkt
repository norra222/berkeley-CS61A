#lang racket

; Toggle implementation
(require "rectangle-implementation-1.rkt")
;(require "rectangle-implementation-2.rkt")

; Exercise 2.3
; Procedures which use the rectangle interface methods 'rect-width' and 'rect-height'
; to calculate the rectangle perimeter and area
(define (rect-perim rect)
  (* 2 (+ (rect-width rect) (rect-height rect))))

(define (rect-area rect)
  (* (rect-width rect) (rect-height rect)))

; Function to print rectangle details
(define (print-rect rect)
  (display "Rectangle: ")
  (newline)
  (display "Perimeter: ")
  (display (rect-perim rect))
  (newline)
  (display "Area: ")
  (display (rect-area rect)))

; Testing the implementation
(print-rect rect)
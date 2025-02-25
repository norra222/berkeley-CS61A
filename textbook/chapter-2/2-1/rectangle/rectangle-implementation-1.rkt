#lang racket
(require "rectangle-helpers.rkt")
(provide rect rect-height rect-width)

; Exercise 2.3
; First Implementation
; Represent a rectangle as an origin point, height, width and angle. Store the 4 data
; points in 2 sets of pairs, themselves in a pair.

(define (make-rect origin height width angle)
  (cons (cons height width) (cons origin angle)))

(define (rect-height rect) (car (car rect)))
(define (rect-width rect) (cdr (car rect)))

(define (rect-origin rect) (car (cdr rect)))
(define (rect-angle rect) (cdr (cdr rect)))

; Create a rectangle using this implementation for testing
(define origin (make-point 1 1))
(define height 4.0)
(define width 5.0)
(define angle 0.2)

(define rect (make-rect origin height width angle))
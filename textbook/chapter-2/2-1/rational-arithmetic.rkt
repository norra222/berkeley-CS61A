#lang racket
(require "make-rational.rkt")

; Procedures to add, subtract, multiply, and divide rational numbers
; using the procedures defined in "make-rational.rkt". The procedures
; here do not need to worry about how the rational number is constructed
; under the hood; it just needs a function for making rational numbers
; (make-rat), getting the numerator (numer), and getting the denominator
; (denom)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat one-third)

(print-rat (mult-rat one-half one-third))

(print-rat (add-rat one-third one-third))

(define negative-half (make-rat -1 -2))
(print-rat negative-half)
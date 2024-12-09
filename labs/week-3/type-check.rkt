#lang racket
(require berkeley)

; Question 4
; A procedure which takes in a function, a predicate and a value
; and checks whether the value is a valid data type using the predicate.
; If it's not valid return false, if it is valid, call the function
; that was passed in with the value that was passed in.

(define (type-check func pred? val)
  (if (pred? val)
      (func val)
      #f))

(type-check sqrt number? 'hello)
(type-check sqrt number? 4)
#lang racket

(require "compose.rkt")

; 1.44

(define (smooth f)
  (let ((dx 0.1))
    (lambda (x)
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))


; nth smoothing i.e. call smooth n times using repeat from compose.rkt
(((repeated smooth 3) sin) 1.0)

      
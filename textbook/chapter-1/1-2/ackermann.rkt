#lang racket

; 1.10 - Ackermann's Function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;(A 1 10) ; 1024
;(A 2 4)  ; 65536
;(A 3 3)  ; 65536

(define (ack m n)
  (cond ((= m 0) (+ n 1))
        ((= n 0) (ack (- m 1) 1))
        (else (ack (- m 1) (ack m (- n 1))))))

;(ack 4 1) ; LONG!
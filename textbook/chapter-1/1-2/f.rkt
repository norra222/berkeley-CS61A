#lang racket

; 1.11

; Recursive
(define (f-rec n)
  (if (< n 3) n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))


; Iterative
(define (f-it n)
  (define (iter c f-1 f-2 f-3 n)
    (if (= c n) (+ f-1 (* 2 f-2) (* 3 f-3))
        (iter (+ c 1)
              (+ f-1 (* 2 f-2) (* 3 f-3))
              f-1
              f-2
              n)))
  (if (< n 3) n
      (iter 3 2 1 0 n)))


(f-rec 5) ; 25
(f-it 5)  ; 25
#lang racket

(define (product f a next b)
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

(define (product-iter f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

(define (identity x) x)
(define (single-iter x) (+ x 1))

(define (factorial x) (product identity 1 single-iter x))

;(product identity 1 single-iter 10)
;(factorial 5)

(define (pi-f x)
  (* (/ x (+ x 1))
     (/ (+ x 2) (+ x 1))))

(define (pi-next x) (+ x 2))

(define (pi-approx n)
  (* 4 (product-iter pi-f 2.0 pi-next n)))

(pi-approx 1000)


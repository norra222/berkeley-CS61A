#lang racket

; Exercise 1.32

(define (accum combiner null f a next b)
  (if (> a b)
      null
      (combiner (f a)
                (accum combiner null f (next a) next b))))

(define (accum-iter combiner null f a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (f a)))))
  (iter a null))


(define (product f a next b)
  (accum-iter * 1 f a next b))

(define (sum f a next b)
  (accum-iter + 0 f a next b))

; Test sum with simpsons
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (/ h 3)
     (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f a add-2h b))
        (f b))))

(define (cube x) (* x x x))

(simpson cube 0 1.0 1000) ; 0.25

; Test product with pi-approx
(define (pi-f x)
  (* (/ x (+ x 1))
     (/ (+ x 2) (+ x 1))))

(define (pi-next x) (+ x 2))

(define (pi-approx n)
  (* 4 (product pi-f 2.0 pi-next n)))

(pi-approx 1000) ; 3.1415926...
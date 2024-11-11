#lang racket

; rewrite formula into odd and evens
; h/3 (y0 + 2(y2 + y4 ...+ yn) - yn + 4(y1 + y3 ...+ yn-1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (/ h 3)
     (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f a add-2h b))
        (f b))))

(define (cube x) (* x x x))

(simpson cube 0 1.0 1000)
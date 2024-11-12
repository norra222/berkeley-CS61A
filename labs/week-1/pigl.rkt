#lang racket
(require berkeley test-engine/racket-tests)

; Implementing pig-latin

(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

; Add a trace to output each recursive call
(trace pigl)

(check-expect (pigl 'thanks)
              'anksthay)
(test)
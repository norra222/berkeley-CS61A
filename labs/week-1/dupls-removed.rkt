#lang racket
(require berkeley test-engine/racket-tests)

; Procedure which removed duplicate words from an input sentence

(define (dupls-removed s)
  (if (equal? s '())
      s
      (if (member? (first s) (bf s))
          (sentence (dupls-removed (bf s)))
          (sentence (first s) (dupls-removed (bf s))))))

(check-expect (dupls-removed '(a big cow))
              '(a big cow))
(check-expect (dupls-removed '(a b c a e d e b))
              '(c a d e b))
(check-expect (dupls-removed '(a a a b a a))
              '(b a))
(test)
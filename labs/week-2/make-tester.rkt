#lang racket
(require berkeley test-engine/racket-tests)

; Procedure which given a check word as argument returns a procedure
; which takes one test argument that returns true if it's input is
; equal to the check word and false otherwise

(define (make-tester w)
  (lambda (test) (equal? w test)))

(check-expect ((make-tester 'hi) 'hi) #t)
(check-expect ((make-tester 'hi) 'bye) #f)

; Make a procedure which checks for the word gerry using the
; make-tester procedure

(define sicp-author-and-astronomer? (make-tester 'gerry))

(check-expect (sicp-author-and-astronomer? 'hal) #f)
(check-expect (sicp-author-and-astronomer? 'gerry) #t)
(test)

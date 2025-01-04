#lang racket
(require berkeley "twenty-one.rkt" "strategies.rkt")

; Part 3
; Play n games with a given strategy and output the number of games won by
; the player minus the number of games won by the dealer.

(define (play-n strat games)
  (define (play result n)
    (if (= n 0)
        result
        (play (+ result (twenty-one strat)) (- n 1))))
  (play 0 games))


; Play the input number of games with all strategies from "stragegies.rkt" and
; output the results

(define (play-all games)
  (display "stop-at-17: ")
  (display (play-n stop-at-17 games))
  (newline)
  (display "dealer-sensitive: ")
  (display (play-n dealer-sensitive games))
  (newline)
  (display "valentine: ")
  (display (play-n valentine games))
  (newline)
  (display "majority-strat: ")
  (display (play-n majority-strat games))
  (newline)
  (display "reckless-17: ")
  (display (play-n reckless-17 games))
  (newline))


; Play 1000 games with each strategy

(play-all 1000)

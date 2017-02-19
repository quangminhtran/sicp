#lang racket

(define (move n from to sparse)
  (cond ((= n 0) "DONE")
        (else
         (move (decr n) from sparse to)
         (printf "Move ~a to ~a~n" from to)
         (move (decr n) sparse to from) 
         )))

(define (decr x) (- x 1))

(move 3 "1" "2" "3")

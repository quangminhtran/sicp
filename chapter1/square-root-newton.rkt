#lang racket

(define (square x)
  (* x x))

;; Compute square root using Newton's method of successive approximation
;; In order to compute sqrt(x)
;; Initial guess: y
;; A better guess is : (y + x/y)/2
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; A guess is good enough if |guess^2 - x| < tolerance
; Ex. 1.7: 
; Statement 1: This good-enough? is not very efficient for finding square root of very small numbers.
; Why?
; Statement 2: In real computers, arithmetic operations are almost performed with limited precision.
; This makes our this version of good-enough inadequate for very large numbers.
; Why?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x)); Initial guess: 1.0

(sqrt 0.0000000001)

(square (sqrt 0.0000000001))
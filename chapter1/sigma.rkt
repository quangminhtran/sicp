#lang racket

(define (inc x) (+ x 1))

(define (square x) (* x x))

(display "Solutions without generic sum\n")
         
; Sigma_a^b = a + (a+1) + ... + b 
(define (sum-int a b)
  (if (> a b)
      0
      (+ a
         (sum-int (inc a) b))))
(sum-int 1 4)

; Sigma_a^b = a^2 + (a+1)^2 + ... + b^2
(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (inc a) b))))
(sum-sq 1 4)

; Sigma = 1/1*3 + 1/5.7 + 1/9*11 + ..... = approximation of Pi/8
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))
(* 8 (pi-sum 1 10000))

; Define the concept of mathematical "sigma" (sum)
; Required input:
;       term   : function that returns the current term
;       a      : lower bound
;       next   : function that produces the next index of an input index
;       b      : upper bound
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))));

(define (sum-int-2 a b)
  (define (identity x) x)
  (sum identity a inc b))

(display "Solutions generic sum\n")

(define (sum-sq-2 a b)
  (sum square a inc b))

(define (pi-sum-2 a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(sum-int-2 1 4)
(sum-sq-2 1 4)
(* 8 (pi-sum-2 1 10000))
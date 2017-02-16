#lang racket

(define (inc x) (+ x 1))

(define (square x) (* x x))

; Sigma_a^b = a + (a+1) + ... + b 
(define (sum-int a b)
  (if (> a b)
      0
      (+ a
         (sum-int (inc a) b)))) 

; Sigma_a^b = a^2 + (a+1)^2 + ... + b^2
(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (inc a) b))))


; Define the concept of mathematical "sigma" (sum)
; Required input:
;       term   : 
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

(define (sum-sq-2 a b)
  (sum square a inc b))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(sum-int 1 3)
(sum-sq 1 3)
(sum-int-2 1 3)
(sum-sq-2 1 3)
(* 8 (pi-sum 1 1000))
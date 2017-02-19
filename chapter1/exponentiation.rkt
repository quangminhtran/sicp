#lang racket

(define x 2)
(define y 8)

; Calculate b^n using recursive process
; Time O(n)
; Space O(n)
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(display "Recursive process\n")
(expt x y)

; Calculate b^n using recursive process
; Time O(n)
; Space O(1)
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))
(define (expt-2 b n)
  (expt-iter b n 1))

(display "iterative process\n")
(expt-2 x y)

; Calculate b^n using successive squaring (fast!)
; b^n = (b^{n/2})^2 if n is even
; b^n = b*b^{n-1}   if n is odd
; Time  O(log n) 
; Space O(log n)
(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(display "successive squaring\n")
(fast-expt x y)







#lang racket

; Fibonacci - Tree recursion
(define (Fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (Fib (- n 1))
                 (Fib (- n 2))))))
(display "Fibonacci with tree recursion\n")
(Fib 12)

; Fibonacci - Interative process
; Starting point: a <- 1, b <- 0
; Incremental step: a <- a + b
;                    b <- a
; At n-th step: a = Fib(n+1), b = Fib(n)

(define (fib-iter a b n)
  (if (= n 0)
      b
      (fib-iter (+ a b)
                a
                (- n 1))))

(define (Fib-Iter n)
  (fib-iter 1 0 n))

(display "Fibonacci with tree recursion\n")
(Fib-Iter 12)


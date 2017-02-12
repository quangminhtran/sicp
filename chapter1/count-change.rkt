#lang racket

; Recurisvely calculate the number of possible changes. OMG the sicp's solution is soooo beautiful!
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

; Return the denomination of the first coin
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; Return the number of possible ways of making change of amount
(define (count-change amount)
  (cc amount 5))

; Recursively calculate all possible change solutions
(define (dc amount kinds-of-coins coins)
  (cond ((= amount 0) (list coins))
        ((or (< amount 0) (= kinds-of-coins 0)) null)
        (else (append (dc amount
                          (- kinds-of-coins 1)
                          coins)
                      (dc (- amount
                             (first-denomination kinds-of-coins))
                          kinds-of-coins
                          (cons (first-denomination kinds-of-coins) coins))))))

; Display all possible ways of making change of amount
(define (display-change amount)
  (dc amount 5 null))

; Recursively calculate all possible change solutions. The kinds-of-coins are passed as argument.
(define (dc-configurable-coins amount kinds-of-coins coins)
  (cond ((= amount 0) (list coins))
        ((or (< amount 0) (null? kinds-of-coins)) null)
        (else (append (dc-configurable-coins amount
                          (cdr kinds-of-coins)
                          coins)
                      (dc-configurable-coins (- amount
                             (car kinds-of-coins))
                          kinds-of-coins
                          (cons (car kinds-of-coins) coins))))))

; Display all possible ways of making change solutions. The kinds of coins are configurable.
(define (display-change-configurable-coins amount kinds-of-coins)
  (dc-configurable-coins amount kinds-of-coins null))


(count-change 20)
(display-change 20)
(display-change-configurable-coins 20 (list 50 25 10 5 1))

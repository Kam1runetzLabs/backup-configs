#lang racket
(define (div a b) 
 (/ (- a (remainder a b)) b))

(define (revert-number-iter number result)
 (if (= number 0) result (revert-number-iter (div number 10) (+(* result 10) (remainder number 10)))))

(define (revert-number number)
 (revert-number-iter number 0))

(define (even? num)
 (= (remainder num 2) 0))

(define (square number)
 (* number number))

(define (expmod base expn m)
 (cond (( = expn 0 ) 1)
       ((even? expn) (remainder (square (expmod base (/ expn 2) m)) m)) 
       (else (remainder (* base (expmod base (- expn 1) m)) m))))

(define (ferma-test n)
 (define (try-it a)
   (= (expmod a n n) a))
 (try-it (+ 1 (random (- n 1)))))

(define (backward-prime number)
 (and (ferma-test number) (ferma-test (revert-number number))))


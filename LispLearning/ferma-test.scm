(define (even number)
 (= (remainder number 2) 0))

(define (square number)
 (* number number))

(define (expmod base exponent m)
 (cond 
  ((= exponent 0) 1)
  ((even? exponent) (remainder (square (expmod base (/ exponent 2) m)) 2 ))
  (else (remainder (* base (expmod base (- exponent 1) m )) m))
  ))

(define (ferma-test number)
 (define (try-it a) (= (expmod a number number) a))
 (try-it ( + 1 (random (- number 1)))) ; todo: random function implementation
 )

(display (ferma-test 123))

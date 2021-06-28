(define (eval? number)
 (= (remainder number 2) 0))

(define (fast-exp base exponent)
 (fast-exp-iter 1 base exponent)
 )

(define (square number)
 (* number number))

(define (fast-exp-iter state-var base exponent)
 (cond 
  ((= exponent 0) state-var)
  ((eval? exponent) (fast-exp-iter (* state-var (square base)) (square base) ( - (/ exponent 2) 1) ))
  (else (fast-exp-iter (* state-var base) base (- exponent 1)))
  ))

(display (fast-exp 2 1000))

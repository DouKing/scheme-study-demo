#lang racket
(cons "hi" "everybody")
(cons (cons 0 1) (cons 1 2))
(cons 0 `())
(cons 3 (cons 1 2))
(cons (cons 1 `()) `())
(cons 1 (cons 10 (cons 100 `())))
(cons "sum of" (cons (cons 1 (cons 10 (cons 100 `()))) (cons "is" (cons 111 `()))))

(car `(1 2 3 4))
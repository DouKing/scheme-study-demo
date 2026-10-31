#lang racket

(define colors (list "red" "green" "blue"))

(quote (1 2 3))
`(1 2 3)  ; 用 ` 代替 quote

'road
(quote (1 . 2))

(car (quote (road map)))
(cdr (quote (road map)))
(car (quote (1 2)))

;; (+ 1 . (2)) => (+ 1 . 2) => (+ 1 2)
'(+ 1 . (2))  ; '(+ 1 2)

'(1 . < . 2)  ; '(< 1 2)
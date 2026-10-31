#lang racket

(define (avg lst)
  (/ (apply + lst) (length lst)))

((lambda x x) 1 2 3)
((lambda x x))

(define greet
  (lambda (given [surname "Smith"])
    (string-append "Hello, " given " " surname)))

(define greet2
  (case-lambda 
    [(name) (string-append "Hello, " name)]
    [(given surname) (string-append "Hello, " given " " surname)]))

;; 科里化

;;(define make-add-suffix
;;  (lambda (s2)
;;    (lambda (s) (string-append s s2))))

(define ((make-add-suffix s2) s)
  (string-append s s2))

;; 绑定多个值
(define-values (given surname)
  (values "Adam" "Smith"))

;; 绑定 let let* letrec
(let ([x "a"]
      [y "b"])
  (display (string-append x y)))

(let* ([x 1]
       [y 2]
       [z (+ x y)])
  (display (number->string z)))

;; 命名 let

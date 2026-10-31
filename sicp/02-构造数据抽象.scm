#lang sicp

;; 序对
(cons 1 2)

(define x (cons 1 2))
(car x)
(cdr x)

(define y (cons 3 4))
(define z (cons x y))
(car (cdr z))
(car (car z))


;; 序列
(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))
(list 1 2 3 4)

;; 表的映射
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(map (lambda (x) (* x x))
     (list 1 2 3 4))

(define (for-each proc items)
  (if (null? items)
      nil
      (begin (proc (car items))
             (for-each proc (cdr items))
             #t)))

(for-each (lambda (x) (display x))
          (list 1 3 5 7))


;; 层次结构

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
#lang racket

;;; let 声明局部变量 (let binds body)
(let ((i 1) (j 2))
  (+ i j))

;;; let 嵌套
(let ((i 1))
  (let ((j (+ i 2)))
    (+ i j)))

;;; let* （let嵌套的语法糖）
(let* ((i 1) (j (+ i 2)))
  (+ i j))

;;; let 表达式是lambda的语法糖
((lambda (i j)
   (+ i j))
 1 2)

;;; 递归
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

(fact 5)

;;; 尾递归
(define (fact-rect n p)
  (if (= n 1)
      p
      (let ((m (- n 1)))
        (fact-rect m (* p m)))))

(define (fact-trail n)
  (fact-rect n n))

(fact-trail 5)

;;; 表与递归
(define (list*2 ls)
  (if (null? ls)
      `()
      (cons (* 2 (car ls))
            (list*2 (cdr ls)))))

(list*2 `(11 12))

;;; named let
(define (fact-let n)
  (let loop((n1 n) (p n))
    (if (= n1 1)
        p
        (let ((m (- n1 1)))
          (loop m (* p m))))))

(fact-let 5)

;;; letrec
(define (fact-letrec n)
  (letrec ((iter (lambda (n1 p)
                   (if (= n1 1)
                       p
                       (let ((m (- n1 1)))
                         (iter m (* p m)))))))
    (iter n n)))

(fact-letrec 5)


;;; do表达式 (do binds (predicate value) body)
(define (fact-do n)
  (do ((n1 n (- n1 1)) (p n (* p (- n1 1)))) ((= n1 1) p)))

(fact-do 5)
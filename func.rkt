#lang racket
;;; 高阶函数

(sort `(7883 9099 6729 2828 7754 4179 5340 2644 2958 2239) <)
(sort `(7883 9099 6729 2828 7754 4179 5340 2644 2958 2239)
      (lambda (x y) (< (modulo x 100) (modulo y 100))))
(map + `(1 2 3) `(4 5 6))
(map (lambda (x) (* x x)) `(1 2 3))

(define sum 0)
(for-each (lambda (x) (set! sum (+ sum x))) `(1 2 3 4))
sum

(define (double ls)
  (map (lambda (x) (* x 2)) ls))
(double `(1 2 3))

(define (sub ls1 ls2)
  (map - ls1 ls2))
(sub `(4 5 6) `(1 2 3))

;;; member-if
(define (member-if proc ls)
  (cond
   ((null? ls) #f)
   ((proc (car ls)) ls)
   (else (member-if proc (cdr ls)))))

(member-if positive? '(0 -1 -2 3 5 -7))

;;; member
(define (member proc obj ls)
  (cond
    ((null? ls) #f)
    ((proc obj (car ls)) ls)
    (else (member proc obj (cdr ls)))))

(member string=? "hello" `("hi" "guys" "bye" "hello" "see you"))

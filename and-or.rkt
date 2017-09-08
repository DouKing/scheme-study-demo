#lang racket

;;; and 返回第一个为#f的参数，直到最后一个
;;; 条件都成立才成立
(define (pro3and a b c)
    (and (positive? a)
         (positive? b)
         (positive? c)
         (* a b c)))

(pro3and 1 2 3)
(pro3and 1 2 -3)

;;; or 返回第一个为#t的参数，直到最后一个
;;; 有一个条件成立就成立
(define (pro3or a b c)
    (if (or (negative? a)
        (negative? b)
        (negative? c))
        (* a b c)
        #f))
(pro3or 1 2 3)
(pro3or 1 2 -3)

;;; cond
(define grade
  (lambda (score)
    (cond
      ((>= score 80)    `A)
      ((>= 79 score 60) `B)
      ((>= 59 score 40) `C)
      (else             `D))))

(grade 77)
(grade 90)

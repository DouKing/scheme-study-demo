#lang racket

(define (read-file file-name)
  (let ((p (open-input-file file-name)))
    (let loop((ls1 `()) (c (read-char p)))
      (if (eof-object? c)
          (begin
            (close-input-port p)
            (list->string (reverse ls1)))
          (loop (cons c ls1) (read-char p))))))

(read-file "tt.txt")

(define (s-read file-name)
  (with-input-from-file file-name
    (lambda ()
      (let loop((ls1 `()) (s (read)))
        (if (eof-object? s)
            (reverse ls1)
            (loop (cons s ls1) (read)))))))

(display (read-file "tt.txt"))

;;; 以 sep 分割表 ls
(define (group-list ls sep)
  (letrec ((iter (lambda (ls0 ls1)
                   (cond
                     ((null? ls0) (list ls1))
                     ((eqv? (car ls0) sep)
                      (cons ls1 (iter (cdr ls0) `())))
                     (else (iter (cdr ls0) (cons (car ls0) ls1)))))))
    (map reverse (iter ls `()))))

;;; 按行读取文件到表
(define (read-lines file-name)
  (with-input-from-file file-name
    (lambda ()
      (let loop((ls1 `()) (c (read-char)))
        (if (eof-object? c)
            (map list->string (group-list (reverse ls1) #\Linefeed))
            (loop (cons c ls1) (read-char)))))))

(read-lines "tt.txt")

;;; 拷贝文件from->to
(define (my-copy-file from to)
  (let ((pfr (open-input-file from))
        (pto (open-output-file to)))
    (let loop((c (read-char pfr)))
      (if (eof-object? c)
          (begin
            (close-input-port pfr)
            (close-output-port pto))
          (begin
            (write-char c pto)
            (loop (read-char pfr)))))))

;;;(my-copy-file "tt.txt" "tt-copy.txt")

;;; 新行分割多个字符
(define (print-lines . lines)
  (let loop ((ls0 lines))
    (if (pair? ls0)
        (begin
          (display (car ls0))
          (newline)
          (loop (cdr ls0)))
        #t)))

(print-lines "a" "s" "d" "f")

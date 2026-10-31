#lang racket

(= 1 1.0)  ;; #t
(eqv? 1 1.0)  ;; #f

(integer->char 65)
(char->integer #\a)

#\λ
#\u03BB

(string-ref "Apple" 0)
(define s (make-string 5 #\.))
(string-set! s 2 #\λ)

(byte? 0)
(byte? 256)

(symbol? 'a)
(eq? 'a (string->symbol "a"))

(write 'Apple)
(display 'Apple)
(write '|6|)
(display '|6|)

;; vector
#("a" "b" "c")

(list->vector (map string-titlecase
                   (vector->list #("three" "blind" "mice"))))

;; Hash Table

(define ht (make-hash))
(hash-set! ht "apple" '(red round))
(hash-set! ht "banana" '(yellow long))
(hash-ref ht "apple")
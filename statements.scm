;求绝对值
(define (my-abs n)
    (* n
       (if (positive? n) 1 -1)))

(define (inv n)
	(if (not (zero? n))
		(/ n)
		#f))

(define (i2a n)
	(if (<= 33 n 126)
		(integer->char n)
		#false))

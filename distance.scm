;define of pi
(define pi (* 4 (atan 1.0)))

;distance -> deg
(define (radian deg)
	(* deg (/ pi 180.0)))

(define (ff-time vy)
	(/ (* 2.0 vy) 9.8))

(define (dx vx t)
	(* vx t))

;distance
(define (distance v ang)
	(dx
		(* v (cos (radian ang)))
		(ff-time (* v (sin (radian ang))))))


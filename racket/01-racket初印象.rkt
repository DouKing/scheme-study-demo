#lang racket

(+ 1 1)

(expt 2 3)

(quotient 5 2) ; 求商

(require 2htdp/image) ; How To Develop Program, 2nd Edition

(define flag (rectangle 100 61.8 "solid" "red"))

(define big-star (star 15 "solid" "yellow"))

(overlay big-star flag)     ; 覆盖

(triangle 40 "solid" "tan") ; 三角形

(rhombus 40 60 "outline" "magenta")

(circle 20 "solid" "green") ; 圆

(ellipse 50 30 "solid" "purple") ; 椭圆

(overlay (ellipse 10 10 "solid" "red")
         (ellipse 20 20 "solid" "black")
         (ellipse 30 30 "solid" "red")
         (ellipse 40 40 "solid" "black")
         (ellipse 50 50 "solid" "red")
         (ellipse 60 60 "solid" "black"))

(overlay/xy (rectangle 20 20 "solid" "red")
            10 10
            (rectangle 20 20 "solid" "black"))

(define (my-star x)
  (radial-star x 8 64 "solid" "darkslategray"))

(my-star 20)

(place-image (my-star 30) 75 75 (empty-scene 150 150))

;; 动画

(require 2htdp/universe)

(animate (lambda (x)
           (place-image (my-star (+ x 2)) 75 75 (empty-scene 150 150))))


(define (my-new-star x)
  (radial-star (+ (remainder x 100) 2) 8 64 "solid" "darkslategray"))

(animate (lambda (x)
           (place-image (my-new-star x) 75 75 (empty-scene 150 150))))

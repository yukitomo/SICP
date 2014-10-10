;Ex1.1

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
b a)
(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a) ((< a b) b)
(else -1)) (+ a 1))

;Ex1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))  (* 3 (- 6 2) (- 2 7)))

;Ex1.3
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (sum-of-2top-squares a b c)
  (cond ((and (> a c) (> b c)) (sum-of-squares a b))
  	((and (> b a) (> c a)) (sum-of-squares b c))
	((and (> c b) (> a b)) (sum-of-squares c a))
	(else (sum-of-squares a b))))

;Ex1.4
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))


(a-plus-abs-b 10 -10)
;ex1.5
(define (p) (p)) 

(define (test x y)
   (if (= x 0) 0 y))
;normalなので、引数の(p)を呼びだしを繰り返ししてしまうため。
(test 0 (p))

;--------------------------------------------------------
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x))

;Ex1.6
(define (new-if predicate then-clause else-clause) 
   (cond (predicate then-clause)
   (else else-clause)))

(define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
    guess (sqrt-iter (improve guess x) x)))

「特殊形式ifの評価規則は、解釈系が正規順序と作用的順序のどちらを使うかに無関係に同じとする。述語式を最初に評価し、その結果が帰結式と代替式のいずれを評価するかを決める。」(p.12)
if式を使わずにcondで実装したことにより、以上の性質が利用できない。問題文中で定義されているsqrt-iterでは、new-ifに作用させるために(sqrt-iter (improve guess x) x) が無限に呼ばれてしまう。

;Ex1.7
(define (sqrt-iter2 guess pre-guess x)
    (if (good-enough? guess pre-guess)
        guess
        (sqrt-iter2 (improve guess x) guess x)))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))
;(guess - pre-guess)/guess < 0.001 ならばよい
(define (good-enough? guess pre-guess)
    (< (/ (abs (- guess pre-guess)) guess) 0.001))

(define (sqrt x)
    (sqrt-iter2 1.0 100.0 x))

;Ex1.8

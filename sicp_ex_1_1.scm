;sicp_ex_1_1.scm

(print 10)
(print (+ 5 3 4))
(print (- 9 1))
(print (/ 6 2))
(print (+ (* 2 4) (- 4 6)))
(print (define a 3))
(print (define b (+ a 1)))
(print (+ a b (* a b)))
(print (= a b))
(print (if (and (> b a) (< b (* a b)))
b a))
(print 100)
(print  (cond ((= a 4) 6) ((= b 4) (+ 6 7 a)) (else 25)))
(print (+ 2 (if (> b a) b a)))
(print (* (cond ((> a b) a) ((< a b) b))
(print (else -1)) (+ a 1)))






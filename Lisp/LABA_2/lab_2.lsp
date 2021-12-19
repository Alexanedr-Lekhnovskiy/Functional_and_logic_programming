;ФИКС


(define (del-all lsta lst)
  (cond 
   ((null? lst) '())
   ( (and (atom? (first lst)) (member (first lst) lsta)) (cons (first lst) (del-all lsta (rest lst))))
   (true (del-all lsta (rest lst)))
  ) 
)



(define (lab2 lst1 lst2)
  (let 
   ((s1 (del-all lst2 lst1))
   (s2 (del-all lst1 lst2)))
   (= s1 s2)
  )
)

(lab2  '(a b x c) '(h a x d))
(lab2  '(a b x c) '(h x d a))

(lab2 '(1 (2 3 4) a (5 6 7) 2 () b) '((q w e r t y) 1 a (2 3 4) 2 b))
(lab2 '(b (2 3 4) a (5 6 7) 2 () 1) '((q w e r t y) 1 a (2 3 4) 2 b))

(lab2 '(1 2 3 4) '(6 2 5 4))
(lab2 '(1 2 3 4) '(6 2 5 4 8 9))
(lab2 '(1 b c d 2 5 6 7 9 0) '())



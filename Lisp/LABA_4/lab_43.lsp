;Реализовать функцию, возвращающую Т в том случае, если одинаковые атомы расположены в исходных списках в одном и том же порядке.

; Реализация через let

(define (del-all lsta lst)
  (cond 
   ((null? lst) '())
   ( (and (atom? (first lst)) (member (first lst) lsta)) (cons (first lst) (del-all lsta (rest lst))))
   (true (del-all lsta (rest lst)))
  ) 
)



(define (task3_let lst1 lst2)
  (let 
   ((s1 (del-all lst2 lst1))
   (s2 (del-all lst1 lst2)))
   (= s1 s2)
  )
)

(task3_let  '(a b x c) '(h a x d))
(task3_let  '(a b x c) '(h x d a))

(task3_let '(1 (2 3 4) a (5 6 7) 2 () b) '((q w e r t y) 1 a (2 3 4) 2 b))
(task3_let '(b (2 3 4) a (5 6 7) 2 () 1) '((q w e r t y) 1 a (2 3 4) 2 b))

(task3_let '(1 2 3 4) '(6 2 5 4))
(task3_let '(1 2 3 4) '(6 2 5 4 8 9))
(task3_let '(1 2 3 9 4) '(6 2 5 4 8 9))


(task3_let '() '())
(task3_let '(1 a)  '(a 1 a))
(task3_let '(1 b c d 2 5 6 7 9 0) '())
(task3_let '((a b c) d) '( d c a b ))

;Реализация через lambda

(define (del-all lsta lst)
  (cond 
   ((null? lst) '())
   ( (and (atom? (first lst)) (member (first lst) lsta)) (cons (first lst) (del-all lsta (rest lst))))
   (true (del-all lsta (rest lst)))
  ) 
)


(define (task3_lambda lst1 lst2)
  (
   	(lambda (s1 s2)
   		(= s1 s2)
   	) (del-all lst2 lst1) (del-all lst1 lst2) 
  )
)



(task3_lambda  '(a b x c) '(h a x d))
(task3_lambda  '(a b x c) '(h x d a))

(task3_lambda '(1 (2 3 4) a (5 6 7) 2 () b) '((q w e r t y) 1 a (2 3 4) 2 b))
(task3_lambda '(b (2 3 4) a (5 6 7) 2 () 1) '((q w e r t y) 1 a (2 3 4) 2 b))

(task3_lambda '(1 2 3 4) '(6 2 5 4))
(task3_lambda '(1 2 3 4) '(6 2 5 4 8 9))
(task3_lambda '(1 2 3 9 4) '(6 2 5 4 8 9))


(task3_lambda '() '())
(task3_lambda '(1 a)  '(a 1 a))
(task3_lambda '(1 b c d 2 5 6 7 9 0) '())
(task3_lambda '((a b c) d) '( d c a b ))










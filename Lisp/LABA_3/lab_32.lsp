;Сортировка Пузырьком

(define (bubble_sort newlst oldlst)
	(if (= newlst oldlst)
      	newlst
     	(bubble_sort (roundd newlst 0) newlst)
  	)
)

(define (roundd lst i)
	(if (< (+ i 1) (length lst)) 
   		(roundd (swapp lst i) (+ i 1))
        lst
	) 
)

(define (swapp lst j)
	(if (< (nth (+ j 1) lst) (nth j lst))
        (swapping lst j  (+ j 1))
        lst
  	)
)

(define (swapping lst index1 index2)
 	(flat (list (test lst '() 0 index1) (nth index2 lst) (test lst '() (+ index1 1) index2) (nth index1 lst) (test lst '() (+ index2 1) (length lst))) )
)

(define (test lst newlst index1 index2)
  (cond 
   	((= index1 index2) newlst)
    ( true (test lst (add-element-list newlst (nth index1 lst)) (+ index1 1) index2))
   ) 
)

(define (add-element-list lst element)
	(cons lst element)	  
)



(bubble_sort '(10 5 24 8 11 15 123 0 67 35 5 1 11 2000) )
(bubble_sort '() )
(bubble_sort '(100) )
(bubble_sort '(100 55 27) )
(bubble_sort '(34 55) )
(bubble_sort '(55 34) )
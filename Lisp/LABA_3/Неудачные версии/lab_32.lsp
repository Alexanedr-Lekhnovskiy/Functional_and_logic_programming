;Сортировка Пузырьком

(define (bubble_sort newlst oldlst)
	(if (= newlst oldlst)
      	newlst
     	(bubble_sort (roundd newlst 0) newlst)
  	)
)

(define (roundd lst i)
	(if (< (+ i 1) (length lst)) 
   		(roundd (swaping lst i) (+ i 1))
        lst
	) 
)

(define (swaping lst j)
	(if (< (nth (+ j 1) lst) (nth j lst))
        (swap (lst j) (lst (+ j 1)))
  	)
  	lst
)


(bubble_sort '(10 5 24 8 11 15 123 0 67 35 5 1 11 2000) )
(bubble_sort '() )
(bubble_sort '(100) )
(bubble_sort '(100 55 27) )
(bubble_sort '(34 55) )
(bubble_sort '(55 34) )
;Сортировка Шелла с использованием метода Кнута

(define (shell-sort lst)
	(if (< (length lst) 1) 
        lst
		(shell-sort-step lst (knuth-number-steps lst)) 
    )
)

(define (knuth-number-steps lst)
	(- (log (length lst) 3) 1)  
)

(define (shell-sort-step lst step)
	(if	(and (= step -1) (!= (length lst) 2))
        lst
        (if (= (length lst) 2) 
         	(if (< (nth 1 lst) (nth 0 lst))
                (list (nth 1 lst) (nth 0 lst)) 
                lst
            )
         	(sort-the-list step lst (knuth-sorting-step '() step) (knuth-sorting-step '() step) (knuth-sorting-step '() step))
        )	
    )  
)

(define (knuth-sorting-step lst n)
  (cond
    ( (= (length lst) 0) (knuth-sorting-step '(1) n) )
   	( (> (length lst) n) (nth n lst) )
   	( (knuth-sorting-step(flat(list lst (+ (* 3 (nth (- (length lst) 1) lst)) 1))) n) )
  ) 
)

(define(sort-the-list step lst stepValue start currentIndex)
	(cond 
           	((= start (length lst)) (shell-sort-step lst (- step 1)))
            ((< (- currentIndex stepValue) 0) (sort-the-list step lst stepValue (+ start 1) (+ start 1)))
            ((< (nth currentIndex lst) (nth (- currentIndex stepValue) lst)) 	
                 (swap (lst (- currentIndex stepValue)) (lst currentIndex))
                 (sort-the-list step lst stepValue start (- currentIndex stepValue)))
          	((sort-the-list step lst stepValue (+ start 1) (+ start 1)))
    ) 
)



(shell-sort '(21 0 12 7 8 33 -8 77 212 35 41 7 1 4 1 22 6 9 8 3 1 2))
(shell-sort '(55))
(shell-sort '())
(shell-sort '(13 7))
(shell-sort '(21  24))
(shell-sort '(77 8 36))

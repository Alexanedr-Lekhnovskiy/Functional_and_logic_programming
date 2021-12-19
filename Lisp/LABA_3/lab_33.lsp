;Программа объединения двух отсортированных списков в один. 
;При этом порядок сортировки в списке-результате должен сохраняться. 

(define (insert-ordered lst_1 lst_2)
  (cond ( (null? lst_1) lst_2)
        ( (null? lst_2) lst_1)
        ( 
         (< (first lst_1) (first lst_2)) 
         (cons (first lst_1) (insert-ordered (rest lst_1) lst_2))
        )
        ( true (cons (first lst_2) (insert-ordered lst_1 (rest lst_2))) )    
  )   
)
 
 
(insert-ordered '(1 2 4 7 15) '(0 1 2 3 4 5 6 7 11 32)) 
(insert-ordered '() '(1 2 3))
(insert-ordered '() '())
(insert-ordered '(222) '( 4 8 10 12 24 38))
(insert-ordered '(3 7 9 11 33 55 321) '(777))
(insert-ordered '(22 67 128 512) '())
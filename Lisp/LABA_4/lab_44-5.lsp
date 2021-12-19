(define (lisp_interpritator lst)
  (if (atom? (nth 0 lst))
    (isFunc lst 0)
	"MISTAKE first func"
  )
)



(define (isFunc lst i)
	(let (component (nth i lst))
		(case component
    		(+ (plus lst i))
     		(- (minus lst i))
     		(* (multiplication lst i))     
     		(/ (division lst i))
     		(first (my_first lst i))
     		(rest (my_rest lst i))
     		(cons (my_cons lst i))
            (setsubtraction (my_setsubtraction lst i))
     		(true lst)
		)
	)
)

(define (plus lst i)
	(let (n (+ i 1))
 		(if (< n (length lst))
			(if (number? (nth n lst))
				(+ (nth n lst) (plus lst n))	
        		(+ (isFunc (nth n lst) 0) (plus lst n))
			)
 		 	0
 		)
	)
)


(define (minus lst i)
	(let (n (+ i 1))
 		(if (< n (length lst))
			(if (number? (nth n lst))
				(- (nth n lst) (minus lst n))
       			(- (isFunc (nth n lst) 0) (minus lst n))
			)
 		 	0
		 )
	)
)


(define (multiplication lst i)
	(let (n (+ i 1))
		(if (< n (length lst))
			(if (number? (nth n lst))
				(* (nth n lst) (multiplication lst n))
       			(* (isFunc (nth n lst) 0) (multiplication lst n))
			)
   		 1 
 		)
	)
)


(define (division lst i)
	(let (n (+ i 1))
 		(if (< n (length lst))
			(if (number? (nth n lst))
				(/ (nth n lst) (division lst n))
        		(/ (isFunc (nth n lst) 0) (division lst n))
			)
     	  1
 		)
	)
)


(define (my_first lst i)
	(let (n (+ i 1))
    	(if (list? (first(nth n lst)) )
    		(isFunc (first (nth n lst)) 0)
    		(first (isFunc (nth n lst) 0))
     	)
	)
)



(define (check_lst lst i)
  (if (< i (length lst))
  	(if (list? (nth i lst))
     	(cons (isFunc (nth i lst) 0)(check_lst lst (+ i 1)))
     	(cons (nth i lst) (check_lst lst (+ i 1)))
    )
  )
)



(define (my_rest lst i)
	(let (n (+ i 1) )
		(chop (check_lst (rest (nth n lst)) 0))
	)
)


(define (my_cons lst i)
	(let (n (+ i 1) )
    	(chop(check_lst lst n))
	)    
)

(define (my_setsubtraction lst i)
  (let (
        set1 (isFunc (nth 1 lst) 0) 
        set2 (isFunc (nth 2 lst) 0)
       )
	(if (and (isset? set1) (isset? set2))
        (difference set1 set2)
        "Mistake. These are not sets!"
    )
  )
)

(define (isset? lst)
  (if (= (unique lst) lst)
     true
     nil
   )
)


(lisp_interpritator '(+ (+ 23 7) (+ 10 56))) 
(lisp_interpritator '(- (+ 10 56) (- 25 13))) 
(lisp_interpritator '(* (* 2 5) (* 8 9))) 
(lisp_interpritator '(/ (/ 100 4) (/ 10 2))) 
(lisp_interpritator '(- (+ (/ 50 5)(* 3 2))(* 7 2)))
(lisp_interpritator '(first (A (B C) 2 1)))
(lisp_interpritator '(rest (A (B C) 2 1)))
(lisp_interpritator '(first (rest (A B C))))                    
(lisp_interpritator '(+ (- (* (/ 10 2) 3) 9) 100))
(lisp_interpritator '(first (rest (10 (+ 33 1) (- 5 1) 5 (+ 10 1))) 55))
(lisp_interpritator '(cons a b (+ 1 2) (* 2 7) (/ 64 8)))
(lisp_interpritator '(setsubtraction (first ((22 1 2 4 7 8 11) (8 9 19))) (1 2 4 11 22)));
(lisp_interpritator '(setsubtraction ( 1 2 3 4 5 ) (4 5 6 7)));

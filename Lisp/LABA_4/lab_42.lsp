;Разработать программу символьного дифференцирования с применением локальных определений LAMBDA и LET.

(define (differential lst)
  (let (component (first lst))
    (cond 
     
        (
         (= component 'x) 1
        )
     
     	(
         (= component '^)
      		(list '* (nth 2 lst) (list '^ (nth 1 lst) (- (nth 2 lst) 1)))
        )
     
       	(
         (= component '+)
          	(list '+ (differential (nth 1 lst)) (differential (nth 2 lst)))
        )
     
        (
         (= component '-)
        	 (list '- (differential (nth 1 lst)) (differential (nth 2 lst)))
        )
     
        (
         (= component '*)
         	(if (and (number? (nth 1 lst)) (= (nth 2 lst) 'x))
                (nth 1 lst)
                (if (number? (nth 1 lst))
                	(list '* (nth 1 lst) (differential (nth 2 lst))) 
                    (list '+ (list '* (differential (nth 1 lst))(nth 2 lst)) (list '* (differential (nth 2 lst)) (nth 1 lst)))))
        )
     
        (
         (= component '/)
        	(list '/ (list '- (list '* (differential (nth 1 lst)) (nth 2 lst)) (list '*(differential (nth 2 lst)) (nth 1 lst))) (list '^ (nth 2 lst) 2))
        )
     
     	(
         (= component 'ln)
        	(list '* (list '^ (nth 1 lst) '-1) (differential (nth 1 lst)))
        )
        
     	(
         (or (number? component) (and (symbol? component) (not (= component 'x)))) 0
        )
     
     )
  ) 
)   

(differential '(15))
(differential '(x))
(differential '(y))
(differential '(+ (x) (y)))
(differential '(^ x 8))
(differential '(+ (^ x 5) (x)))
(differential '(- (* 4 x) (^ x 4)))
(differential '(* 8 x))
(differential '(* 5 (^ x 3)))
(differential '(* (* 5 x) (^ x 3)))
(differential '(* (x) (^ x 2)))
(differential '(/ (1) (x)))
(differential '(/ (* 7 x) (^ x 7)))
(differential '(ln (x)))
(differential '(ln (^ x 2)))
(differential '(ln (* 3 x)))
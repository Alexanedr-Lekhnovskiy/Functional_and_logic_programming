;Описать функцию вычисления факториала. Рассмотреть варианты решения задачи с
;применением локальных определений LAMBDA и LET. 
(define (fact_let n)
  (let (x (- n 1) )
    (if (or (= n 1) (= n 0))
        1 
    	(* n (fact_let x))
    )
  )
)

(define (fact_lambda n)
  (
   (lambda (x)
      (if (or (= n 1) (= n 0))
          1 
      	(* n (fact_lambda x))
      )
    ) (- n 1)
  )
)

(fact_let 5)
(fact_lambda 5)
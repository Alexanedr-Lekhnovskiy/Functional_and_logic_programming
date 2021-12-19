;Заданы глубина подсписка, позиция и s-выражение.
;Включить s-выражение во все имеющиеся подсписки заданной глубины и на заданную позицию. 

;; Вставить в список lst в позицию n
(define  (ins-in-pos lst v n)
  (cond ( (null? lst) (list v) )
        ( (= n 0) (cons v lst))
        (true (cons (first lst) (ins-in-pos (rest lst) v (- n 1))))
  )
)

;(ins-in-pos '(1 2 3 4 5) '(u u) 3)
;(ins-in-pos '(1 2 3 4 5) '(u u) 5)
;(ins-in-pos '(1 2 3 4 5) '(u u) 14)

(define (task lst lv p v)
  (if (> lv 0) 
      (map 
       	(lambda (x) 
                (if (atom? x) 
                    x
                    (task x (- lv 1) p v)
                )
        ) lst
      )
      (ins-in-pos lst v p)
  )
)


(task '(1 (a v c) 4 (z x c) 3) 1 2 '(GGG))
(task '(a b (c d (e f) ((g h))) i (((j)))) 0 1 '(* *))
(task '(a b (c d (e f) ((g h))) i (((j)))) 1 1 '(* *)) 
(task '(a b (c d (e f) ((g h))) i (((j)))) 1 5 '(* *)) 
(task '(a b (c d (e f) ((g h))) i (((j)))) 1 4 '(* *))
(task '(a b (c d (e f) ((g h))) i (((j)))) 4 1 '(* *))
(task '(a b (c d (e f) ((g h))) i (((j)))) 3 1 '(* *))

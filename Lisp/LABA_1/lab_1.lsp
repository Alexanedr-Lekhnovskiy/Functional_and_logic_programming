;1) задание
;Описать неименованную функцию для объединения голов трех списков ;в один список,
;исходные данные взять из таблицы 4. 

; 1 ВАРИАНТ
;((lambda ()
;	(list (first '(FIR SED (1 2 3) (5) ())) (first '(H J U K (L M N) (D E L))) (first '(4 5 (6 7))))
;))


; 2 ВАРИАНТ

;((lambda (x y z)
;       (list (first x) (first y) (first z)))
;'(FIR SED (1 2 3) (5) ()) '(H J U K (L M N) (D E L)) '(4 5 (6 7)))  


;2) задание
;Описать именованную функцию для создания нового списка из элементов нескольких
;исходных списков. В качестве исходных списков использовать списки таблицы 4. Номера
;элементов списков взять в таблице 5. 


(define (Func list_1 list_2 list_3 number_1 number_2 number_3)
	(if (and (>= (length list_1) number_1)(>= (length list_2) number_2)(>= (length list_3) number_3))  
	(list (nth (- number_1 1) list_1)(nth (- number_2 1) list_2) (nth (- number_3 1) list_3)) 
	"MISTAKE"
))

(Func '(FIR SED (1 2 3) (5) ()) '(H J U K (L M N) (D E L)) '(4 5 (6 7)) 4 4 3)

;3) задание
;Описать именованную функцию в соответствии с вариантом индивидуального задания в
;Таблице 6. 
;Написать функцию, которая для аргумента-списка формирует список-результат
;по правилу: если первый и последний элементы списка-аргумента – четные
;положительные целые числа, то включить в список-результат первым элементом
;– квадрат последнего элемента исходного списка, вторым – четвертую степень
;первого; в противном случае сформировать список из первого и последнего
;элементов. 


;1 ВЕРСИЯ (Исправленная с проверкой пустого списка через функцию null?)
(define (Function list_1 )
	(if (null? list_1) "Fail"
 		(if (and (number? (first list_1)) (number? (last list_1)) 
          		 (= (% (first list_1) 2) 0) (= (% (last list_1) 2) 0)
          		 (> (first list_1)) (> (last list_1)) 
     		)
  			(list(pow (last list_1) 2) (pow (first list_1) 4))                                 
  			(list (first list_1) (last list_1))
		)  
	)
)

(Function '(8 2 2))
(Function '(2 1 1 1 8))
(Function '(10 5 7 9 4))
(Function '(1 2 2 2 10))
(Function '(2 5 7 9 11))
(Function '(A 5 7 9 B))
(Function '())





;2 ВЕРСИЯ (С проверкой пустого списка)

(define (Function list_1 )
  (if(> (length list_1) 0)
 	(if (and (number? (first list_1)) (number? (last list_1)) (= (% (first list_1) 2) 0) (= (% (last list_1) 2) 0) (> (first list_1)) (> (last list_1)) 
        )
  		(list(pow (last list_1) 2) (pow (first list_1) 4))                                 
  		(list (first list_1) (last list_1))
  	) 
  "ERROR"
  )
)

(Function '(10 2 6))
(Function '(2 1 1 1 8))
(Function '(10 5 7 9 4))
(Function '(1 2 2 2 10))
(Function '(2 5 7 9 11))
(Function '(A 5 7 9 B))
(Function '())



;АЛЬТЕРНАТИВНОЕ РЕШЕНИЕ ЗАДАЧИ №3
(define (Function list_1)
     (cond
        ( (null? list_1 ) "Fail")
        ((and (number? (nth 0 list_1)) (number? (nth (- (length list_1) 1) list_1))
              (= (% (nth 0 list_1) 2) 0) (= (% (nth (- (length list_1) 1) list_1) 2) 0)
              (> (nth 0 list_1)) (> (nth (- (length list_1) 1) list_1))  )
         (cons (pow (nth (- (length list_1) 1) list_1) 2) (pow (nth 0 list_1) 4))
        )
        ( 
         (cons (nth 0 list_1) (nth (- (length list_1) 1) list_1))  
        )
     )
)
       
  
(Function '(8 2 2))
(Function '(2 1 1 1 8))
(Function '(10 5 7 9 4))
(Function '(1 2 2 2 10))
(Function '(2 5 7 9 11))
(Function '(A 5 7 9 B))
(Function '())
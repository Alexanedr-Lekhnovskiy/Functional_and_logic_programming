(define (task2 text)
	(if (empty? text)
		"empty"
		(inSentence text 0)
	)
)

(define (inSentence text i)
	(chop (inWord (nth i text) 0))
)

(define (inWord sentence i)
	(if (< i (length sentence))
		(cons 
			(join (addTire (join (inLetter1 (nth i sentence) 0))
				(join (inLetter2 (nth i sentence) 0)) 0))
			(inWord sentence (+ i 1))
        )
	)
)

;Перевод слова в набор цифр
(define (inLetter1 word)
  (map letterToNumber (inLetter2 word 0))
)

;Разбиваем слова на отдельные буквы
(define (inLetter2 word i)
	(if (< i (utf8len word))
		(flat (list (nth i word) (inLetter2 word (+ i 1))))
        '()
	)
)

;Задаём каждой букве цифру 1-4
(define (letterToNumber lit)
	(cond
   		;Шумные согласные
    	((or  (= lit "п") 
        	  (= lit "ф") 
        	  (= lit "т") 
              (= lit "с") 
              (= lit "ш") 
              (= lit "к") 
              (= lit "ц") 
              (= lit "х")
              (= lit "б") 
              (= lit "в") 
              (= lit "г") 
              (= lit "д") 
              (= lit "ж") 
              (= lit "з")
              (= lit "щ")
              (= lit "ч")) "1")
          ;Сонорные согласные
        ((or  (= lit "м") 
              (= lit "н") 
              (= lit "л") 
              (= lit "р")) "2")   
          ;Гласные
        ((or  (= lit "а") 
              (= lit "о") 
              (= lit "у") 
              (= lit "ы")
              (= lit "и")
              (= lit "э")
              (= lit "е")
              (= lit "я")
              (= lit "ё")
              (= lit "ю")) "3")   
          ;Й
        ((or  (= lit "й")) "4")    
	)
)

;Функция добавления тире для деления слова на слоги по правилам
(define (addTire numlst litlst i)
	(if (< i (length numlst))
		(if (= (nth i numlst) "3") ;Если гласная
			(if (> (+ i 3) (length numlst)) ;Если после гласной меньше двух букв	
         
				(if (= (+ i 1) (length numlst))   
					(flat(list(nth i litlst) (addTire numlst litlst (+ i 1))))
					(flat(list (nth i litlst) (addTire numlst litlst (+ i 1))))
            	)
          		
                            
				(if  (and(= (nth (+ i 1) numlst) "1")(= (nth (+ i 2) numlst) "1"));Правило 1 (Сочетание двух шумных или двух сонорных согласных отходит к последующему слогу.)
                    (if (= (+ i 3) (length numlst))
                        (flat(list (nth i litlst) (addTire numlst litlst (+ i 1)))) 
                        (flat(list (nth i litlst) "-" (addTire numlst litlst (+ i 1))))
                     )
					(if (and(= (nth (+ i 1) numlst) "1")(= (nth (+ i 2) numlst) "2"))  ;Правило 2  (Сочетание шумного и сонорного отходит к последующему слогу.)
						(flat(list (nth i litlst) "-" (addTire numlst litlst (+ i 1))))
						(if (and(= (nth (+ i 1) numlst) "2")(= (nth (+ i 2) numlst) "1")) ;Правило 3 (Сочетание сонорного и шумного имеет раздел посередине сочетания.)
                            (if (= (+ i 3) (length numlst))
                       			 (flat(list (nth i litlst) (addTire numlst litlst (+ i 1)))) 
                       			 (flat(list (nth i litlst) (nth (+ i 1) litlst) "-" (addTire numlst litlst (+ i 2))))
                     		)
							(if (or (and(= (nth (+ i 1) numlst) "4") (= (nth (+ i 2) numlst) "2")) (and (= (nth (+ i 1) numlst) "4") (= (nth (+ i 2) numlst) "1"))) ;Правило 4 (Для случая с Й)
(flat(list (nth i litlst) (nth (+ i 1) litlst) "-" (addTire numlst litlst (+ i 2))))
(flat(list (nth i litlst) "-" (addTire numlst litlst (+ i 1)))) 
    						)
						)
					)    
				)  
			)
		(flat(list (nth i litlst) (addTire numlst litlst (+ i 1)))) 
		)
		'()
	)
)


(task2 '(("пушка" "изба" "волна")))
(task2 '(("война" "майка")))
(task2 '(("конспект" "молва")))
(task2 '(("воробей" "богатство" "геркулес" "жигули")))
(task2 '(("рукомойник" "война" "отец" "салфетка" "купэ" "конспект" "пушка" "волна" "творец" "крыша" "морс" "транспорт" "лейка" "ясли")))
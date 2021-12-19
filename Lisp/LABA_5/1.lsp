;Дан текст. Вставить заданное новое слово после каждого вхождения другого
;заданного слова. 
    
;на входе поддаем исходный текст (список предложений), ключевое слово и вставку (то есть слово, которое должно быть вставлено после каждого вхождения ключевого).    
(define (task_1 text keyword insertword)
	(if (empty? text)
      "empty"
      (map flat (myFunc text keyword insertword 0))
	)
)

;работаем с каждым предложением отдельно
(define (myFunc text keyword insertword i)
	(if (< i (length text))
		(cons (inSentence text keyword insertword i) (myFunc text keyword insertword (+ i 1)))
        '()
	)
)

;разбиваем данное предложение на слова и к каждому слову применяем функцию inWord
(define (inSentence text keyword insertword i)
	(list (inWord (nth i text) keyword insertword 0)) 
)

;проверяется данное слово на совпадение с ключевым, в случае успеха производится вставка после вхождения ключевого слова, в противном случае мы переходим к следующему слову в предложении.
(define (inWord predloj keyword insertword i)
	(if (< i (length predloj))
        (cond
         ((= (lower-case (nth i predloj)) (lower-case keyword)) (cons (nth i predloj) (cons insertword (inWord predloj keyword insertword (+ i 1))))
         )
         (true (cons (nth i predloj) (inWord predloj keyword insertword (+ i 1))) 
         )
        )
		'()	
    )
)



(task_1 '(("House" "guy" "floor")) "house" "home")
(task_1 '(("HOUSE" "guy" "floor")) "house" "home")
(task_1 '(("house" "guy" "floor" "house")) "house" "home")
(task_1 '(("house" "guy" "floor" "house") ("wake" "me" "up" "inside")) "home" "house")
(task_1 '(("dog" "sweet" "boy" "_" "boy" "_" "boy" "_" "dreams" "little") ("my" "favorite" "BOY")) "boy" "girl")
(task_1 '(("добрый" "вечер" "господа" "ВЕЧЕР" "мадам" "утро" "вечер")("Вечер" "тяжкий")) "вечер" "темно")
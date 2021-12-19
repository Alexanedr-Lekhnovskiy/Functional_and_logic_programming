;Написать программу, исключающую в исходном тексте из каждого слова его окончание по словарю. Словарь окончаний представлять списком строк. 


(define (task4 text slovar)
  (if (empty? text)
      "empty"
      (startFunc text (reverseEnding slovar 0) 0)
  )
)

(define (startFunc text slovar i)
	(if (< i (length text))
    	(cons (inSentence text slovar i) (startFunc text slovar (+ i 1)))
        '()
    )
)

(define (inSentence text slovar i)
	(inWord (nth i text) slovar 0)
)

(define (inWord sentence slovar i)
	(if (< i (length sentence))
		(cons (join (clipping (inLetter2 (nth i sentence) 0) slovar)) (inWord sentence slovar (+ i 1)))
        '()
	)
)

(define (reverseEnding sentence i)
  (if (< i (length sentence))
	(cons(join (reverse (inLetter2 (nth i sentence) 0) ))(reverseEnding sentence (+ i 1)))
      '()
  )
)

;Обрезает окончание нужной длины 
(define (clipping lst revslovar)
  (chop lst (countCut lst revslovar))  
)

;Возвращает длину окончания, которую надо будет отрезать
(define (countCut lst revslovar)
	(cut (createEnding (reverse lst) revslovar 0) revslovar 0) 
)

;Функция cut сравнивает полученные реверсивные части слова(где каждая часть больше предыдущей) с словарём, где окончания представлены в реверсивном виде.
(define (cut lst revslovar i)
	(if (< i (length lst))
		(if (nil? (find (nth i lst) revslovar))
			(if (= (+ i 1) (length lst))
				0
				(cut lst revslovar (+ i 1))
			)
			(+ i 1)
		)
	)
)

;в данную функцию в качестве аргументов поддается реверсивная последовательность букв исходного слова, словарь, где окончания представлены в реверсивном виде, а также счётчик.Функция возвращает n частей слова, состоящего из n букв. Причём каждая следующая часть больше предыдущей на 1.
(define (createEnding revlst revslovar i)
	(if (< i (length revlst))
		(cons (join (getEnding revlst i)) (createEnding revlst revslovar (+ i 1)))  
        '()
	)
)

;Данная функция возвращает часть слова N0 = 1, N1 = 2, ..., N(N-1) = N 
(define (getEnding revlst i)
	(if (>= i 0)
		(cons (first revlst)  (getEnding (rest revlst) (- i 1)))
        '()
	)
)

;Разбиваем слова на отдельные буквы
(define (inLetter2 word i)
	(if (< i (utf8len word))
		(flat (list (nth i word) (inLetter2 word (+ i 1))))
        '()
	)
)

(task4 '(("добрая" "человек" "малина" "ненасытный" "счастливый")) '("ый"))
(task4 '(( "человек" "малина" "он" "счастливый")) '("ая"))
(task4 '(( "человек" "малина" "он" "счастливый")) '("ая" "ый" "а"))
(task4 '(( "человек" "малина" "он" "счастливый") ("хватит" "пугающе" "страшно" "мы" "мириться" )) '("ая" "ый" "а" "ся"))
(task4 '(("подниматься" "веселый" "тебе" "сильно" "нравиться" "добрый" "молодая" "парнишка" "ружей") ("малый" "добрейший" "мама" "папа" "детей")) '("ся" "ий" "ый" "ая" "а" "ей"))



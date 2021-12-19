PREDICATES
	nondeterm gorod(string)
	show

CLAUSES
	gorod("москва").
	gorod("минск").
	gorod("киев").
	gorod("омск").
	
	show:- gorod(X),write(X),nl,fail.   /*fail-всегда ложно, write и nl - ситемные предикаты(Без альтернатив)*/
	show.   /*Без этой строчки нам show выдаст "no", а с ней "yes" */
	
GOAL

	write("Это города: "),nl,show.
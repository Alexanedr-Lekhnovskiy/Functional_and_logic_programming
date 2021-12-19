DOMAINS 
	gorod, strana = symbol
PREDICATES
	nondeterm situ(gorod, strana)
CLAUSES 
	/*Факты*/
	situ(london, england).
	situ(petersburg, russia).
	situ(kiev, ukraina).
	situ(pekin, asia).
	situ(warszawa, poland).
	situ(berlin, europe).

	/*Правила*/
	/* Заключение :- Условие 
	Если А(условие) то В(заключение)
	B :- A
	*/
	situ(X, europe):- situ(X, russia).  
	situ(X, europe):- situ(X, poland).
GOAL
	/*situ(london, england). */
	/*situ(london, X). */
	situ(X, Y).
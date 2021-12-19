DOMAINS 
dog_list = string* /*создали список dog_list через '*' */

PREDICATES
dogs(dog_list)

CLAUSES
/*Списки на языке Пролог заключаются в квадратные скобки []*/
dogs(["лайка","борзая","дог","болонка"]).

GOAL
/*
	dogs(X).
*/
	dogs([X, Y, Z, T]).


PREDICATES
nondeterm power(integer, integer, integer)
nondeterm exponentiation(integer, integer, integer, integer, integer)

CLAUSES
%Правило для вычисления положительной степени числа
power(Number,Exponent, Result):-
	exponentiation(Number,Exponent,Result,0,1).

exponentiation(_,Exponent,Result,Exponent,Result).
exponentiation(Number,Exponent,Result,Exponent_1,Result_1):-
	Exponent_2 = Exponent_1 + 1, 
	Result_2 = Result_1 * Number,
	exponentiation(Number,Exponent,Result,Exponent_2,Result_2).
	
	
	
GOAL
	write("Результатом возведения в степень будет: "),power(5, 3, L),nl.


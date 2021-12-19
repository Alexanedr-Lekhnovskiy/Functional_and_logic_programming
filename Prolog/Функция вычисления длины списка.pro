DOMAINS
ilst = integer* %список, содержащий переменные типа int

PREDICATES
length_lst(ilst, integer)
distance_lst(ilst, integer, integer)

CLAUSES

%ѕравила дл€ вычислени€ длины списка
length_lst(List, Length):- 
	distance_lst(List,Length, 0).
	
distance_lst([],Length,Length).
distance_lst([_|Tail],Length,Length_1):-
	Length_2 = Length_1 + 1, 
	distance_lst(Tail,Length,Length_2).
	
	
GOAL
	write("ƒлина списка: "),length_lst([2, 11, 33, 0, 2], Length),nl.


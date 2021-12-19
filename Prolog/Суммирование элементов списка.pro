%Суммирование элементов списка
DOMAINS
my_lst = integer*

PREDICATES
sum_lst(my_lst, integer)

CLAUSES
sum_lst([],0).
sum_lst([Head|Tail], Sum):-
	sum_lst(Tail,Sum1),
	Sum = Head + Sum1.


GOAL
sum_lst([1,2,3,4],M),write("Это сумма: ").

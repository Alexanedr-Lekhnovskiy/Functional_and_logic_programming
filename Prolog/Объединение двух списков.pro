%Объединение двух списков
DOMAINS
t_list = integer*


PREDICATES
append(t_list,t_list,t_list)

CLAUSES

append([],L, L).
append([Head_lst1|Tail_lst1],Lst2, [Head_lst1|Tail_res]):-
	append(Tail_lst1, Lst2, Tail_res).

GOAL
	append([1, 2, 3], [4, 4], M).
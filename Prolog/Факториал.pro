PREDICATES
nondeterm fact(integer,integer)

CLAUSES
fact(0,1).
fact(N,M):-
	N1=N-1,fact(N1,M1),M=N*M1.

GOAL
	fact(4,M).
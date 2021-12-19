DOMAINS
number = integer

PREDICATES
nondeterm write_number(number)

CLAUSES
write_number(10).
write_number(N):- N<10,write(N),nl,N1=N+1,write_number(N1).

GOAL
write("Это числа: "),nl,write_number(1).
 
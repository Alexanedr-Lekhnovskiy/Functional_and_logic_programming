%������ ��������� ������
DOMAINS
my_lst = integer*

PREDICATES
print_lst(my_lst)
print_lst_col(my_lst)

CLAUSES
%������ ������ �������
print_lst([]).
print_lst([Head|Tail]):-
	write(Head, " "),print_lst(Tail).

%������ ������ �������
print_lst_col([]).
print_lst_col([Head|Tail]):-
	write(Head),nl,print_lst_col(Tail).

GOAL
	%print_lst([8, 9, 22, 0, 14, 3]),nl.
	%print_lst_col([8, 9, 22, 0, 14, 3]).
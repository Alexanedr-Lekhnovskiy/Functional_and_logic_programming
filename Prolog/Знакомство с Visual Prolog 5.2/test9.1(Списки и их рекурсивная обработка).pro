DOMAINS 
dog_list = string* /*������� ������ dog_list ����� '*' */

PREDICATES
dogs(dog_list)

CLAUSES
/*������ �� ����� ������ ����������� � ���������� ������ []*/
dogs(["�����","������","���","�������"]).

GOAL
/*
	dogs(X).
*/
	dogs([X, Y, Z, T]).
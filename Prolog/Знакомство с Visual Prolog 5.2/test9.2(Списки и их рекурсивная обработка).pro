DOMAINS 
dog_list = string* /*������� ������ dog_list ����� '*' */

PREDICATES
nondeterm print_list(dog_list)

CLAUSES
/**/
print_list([]). /*������ ������*/
/*��� ��� ������ [X|Y] ����� �������� ������ �� ������ X(������ ���������) � ����� Y*/
print_list([X|Y]):- write(X),nl,print_list(Y).

GOAL
/*����������� ����� ���� ��������� ������*/
print_list(["�����","������","���","�������"]).
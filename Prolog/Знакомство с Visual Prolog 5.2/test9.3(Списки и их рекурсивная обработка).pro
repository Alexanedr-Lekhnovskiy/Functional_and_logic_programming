DOMAINS 
dog_list = string* 

PREDICATES
nondeterm find_it(symbol, dog_list)

CLAUSES
/**/
find_it(X,[X|_]).
find_it(X,[_|Y]):- find_it(X, Y).


GOAL
/*����������� ����� �������� �� ������� ��������� � ������*/
find_it("�������", ["�����","���","�������"]),write("��"),nl.

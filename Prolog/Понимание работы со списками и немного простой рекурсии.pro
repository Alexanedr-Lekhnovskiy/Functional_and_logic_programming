DOMAINS
os_list = symbol* %������� ������ � ���������� ���� symbol

PREDICATES
print_list(os_list)

CLAUSES
print_list([]).
print_list([Head|Tail]):- write(Head),nl,print_list(Tail). %����������� �������� � ������� ������, �� ����� ������� ������

GOAL
print_list(["DOS","Windows","Novell","Linux"]).

/*�����
	���� ��� �����, �������������� ���������� ��������, ������
	� ��������� ���������� ����� ��������, � �� ����� ���� ��
	��������� ������������� ��������. 
*/
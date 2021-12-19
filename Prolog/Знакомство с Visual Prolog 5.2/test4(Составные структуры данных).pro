DOMAINS
personlib=book(title,author,publication)
publication=publics(publisher,year)
collector,title,author,publisher=symbol
year=integer

PREDICATES
collection(collector,personlib)

CLAUSES
collection("������", book("����� � ���", "��� ���������� �������", publics("������������", 1990))).

GOAL
/* 
	collection(X, book(Y, Z, publics(T, P))).
	collection(X, book(Y, Z, M)).
	collection(X, book(Y, Z, publics(_, P)))   ('_' - ����������� ��������� ����������, ��� �� ��������� � ���� ����������)
*������ ��������� ��������� ���������� ����� ���� ���������,� ������� �� ������������ ����������(X)
*��������� ����������, ���� �� ��������� ����� �� ������� ����� �����
*/
	collection(X, book(Y, Z, publics(_, P))).
PREDICATES
nondeterm numbers(integer, integer)

CLAUSES
numbers(X,_):- X>100,nl,write(X).
numbers(X,Y):- N=X+Y,write(N), nl,numbers(N,Y).



Goal
numbers(3,4).

/*
1)��������� ��������� (x oper y): +,-,*,/
2)��������� + � - ����� ���� ����������� (�������� -x+y)

3)�������� ��� �������
	X=Y
	X<>Y 
	X<Y 
	X>Y 
	X>=Y 
	X<=Y 
4)���������� � �������
	X+Y ����� X � Y
	X-Y �������� X � Y
	X*Y ������������ X � Y
	X/Y ������� �� ������� X � Y
	X MOD Y ������� �� ������� X �� Y
	�����-������ ����� ��������� ������������� ������� : X DIV Y
	

*/
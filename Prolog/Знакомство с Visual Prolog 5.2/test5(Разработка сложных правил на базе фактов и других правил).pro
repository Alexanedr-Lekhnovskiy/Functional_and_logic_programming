DOMAINS
	person = symbol

PREDICATES
nondeterm otec(person, person)
nondeterm man(person)
nondeterm brat(person, person)

CLAUSES
otec(ivan, igor).
otec(ivan, sidor).
otec(sidor, lisa).
man(X):- otec(X,_).
brat(X,Y):- otec(Z,X),otec(Z,Y),man(X),X<>Y.

GOAL
/*
 ',' - �������� ���������� �
 ';'- �������� ���������� ���
 'not' - ���������� ���������  
 
 otec(ivan, X),write("���� �������� �����: ", X),nl. 
 man(X),write("��� �������� ��������: ", X),nl.
*/
 brat(A, B).

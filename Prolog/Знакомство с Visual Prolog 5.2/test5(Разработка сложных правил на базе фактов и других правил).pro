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
 ',' - означает логическое И
 ';'- означает логическое ИЛИ
 'not' - логическое отрицание  
 
 otec(ivan, X),write("Иван является отцом: ", X),nl. 
 man(X),write("Кто является мужчиной: ", X),nl.
*/
 brat(A, B).

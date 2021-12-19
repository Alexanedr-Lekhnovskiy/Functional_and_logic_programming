PREDICATES
nondeterm numbers(integer, integer)

CLAUSES
numbers(X,_):- X>100,nl,write(X).
numbers(X,Y):- N=X+Y,write(N), nl,numbers(N,Y).



Goal
numbers(3,4).

/*
1)Инфиксные операторы (x oper y): +,-,*,/
2)Операторы + и - могут быть префиксными (Например -x+y)

3)Действия над числами
	X=Y
	X<>Y 
	X<Y 
	X>Y 
	X>=Y 
	X<=Y 
4)Вычисления в Прологе
	X+Y сумма X и Y
	X-Y разность X и Y
	X*Y произведение X и Y
	X/Y частное от деления X и Y
	X MOD Y остаток от деления X на Y
	Турбо-Пролог также допускает целочисленное деление : X DIV Y
	

*/
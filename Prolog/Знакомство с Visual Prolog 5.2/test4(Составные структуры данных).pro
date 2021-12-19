DOMAINS
personlib=book(title,author,publication)
publication=publics(publisher,year)
collector,title,author,publisher=symbol
year=integer

PREDICATES
collection(collector,personlib)

CLAUSES
collection("Иванов", book("Война и мир", "Лев Николаевич Толстой", publics("Провсвещение", 1990))).

GOAL
/* 
	collection(X, book(Y, Z, publics(T, P))).
	collection(X, book(Y, Z, M)).
	collection(X, book(Y, Z, publics(_, P)))   ('_' - ипользуется анонимная переменная, она не выводится в окне результата)
*Важное замечание анонимных переменных может быть несколько,в отличие от именнованных переменных(X)
*Анонимные переменные, если их несколько никак не связаны между собой
*/
	collection(X, book(Y, Z, publics(_, P))).
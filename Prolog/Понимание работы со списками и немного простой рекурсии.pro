DOMAINS
os_list = symbol* %Создали список с элементами типа symbol

PREDICATES
print_list(os_list)

CLAUSES
print_list([]).
print_list([Head|Tail]):- write(Head),nl,print_list(Tail). %Рекрурсивно работаем с головой списка, до конца пустого списка

GOAL
print_list(["DOS","Windows","Novell","Linux"]).

/*ВАЖНО
	Факт или факты, обеспечивающие завершение рекурсии, должны
	в программе помещаться перед правилом, а не после него во
	избежание левосторонней рекурсии. 
*/
DOMAINS 
dog_list = string* /*создали список dog_list через '*' */

PREDICATES
nondeterm print_list(dog_list)

CLAUSES
/**/
print_list([]). /*Пустой список*/
/*Вот эта запись [X|Y] делит исходный список на голову X(всегда атомарный) и хвост Y*/
print_list([X|Y]):- write(X),nl,print_list(Y).

GOAL
/*Рекурсивный вывод всех элементов списка*/
print_list(["лайка","борзая","дог","болонка"]).
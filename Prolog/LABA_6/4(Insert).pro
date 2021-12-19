DOMAINS
ilist=integer* %Список, состоящий из переменных типа integer
anslst= ilist*
 
PREDICATES

ins(integer,integer,integer,ilist,ilist,ilist).

nondeterm member(integer,ilist).

length_lst(ilist, integer)
distance_lst(ilist, integer, integer)

nondeterm get_Numbers(ilist,integer, ilist)

print_my(anslst)

CLAUSES

%К - индекс элемента списка,начиная с единицы
%I - аргумент 'i',который мы вводим сами
%E - втавка,то есть элемент,который мы желаем вставить
%Numbers - список значений n,который формируется по длине исходного списка. Numbers=[1,2,3,...]
%L - иходный список, с которым мы будем работать
%Последний аргумент - это результат, то есть получившийся после вставок список
 
% Для случая, когда мы дошли до места вставки n*i
ins(K,I,E,_,L,[E|Tail]):-
    get_Numbers(L,1,Numbers),
    member(N,Numbers),
    K=N*I,!,
    K1=K+1,
    ins(K1,I,E,Numbers,L,Tail). 

%Для случая, когда мы не дошли до нужного места, и просто идём дальше по списку    
ins(K,I,E,Numbers,[H|Tail],[H|Tail1]):- K1=K+1,ins(K1,I,E,Numbers,Tail,Tail1). 

ins(_,_,_,_,[],[]).

%Получение списка  значений N (в зависимости от  длины исходного списка)
get_Numbers([],_,[1]).
get_Numbers(List,N,ListN):-
	length_lst(List, Length),
	Length >= N, !, 
    	NewN = (N + 1),
	get_Numbers(List,NewN,ListNTail),
	ListN = [N|ListNTail];
    	ListN = [].

%Правила member вытаскивают значения n из списка Numbers
member(H,[H|_]).
member(H,[_|Tail]):- member(H,Tail).
 


%Правила для вычисления длины списка
length_lst(List, Length):- 
	distance_lst(List,Length, 0).
	
distance_lst([],Length,Length).
distance_lst([_|Tail],Length,Length_1):-
	Length_2 = Length_1 + 1, 
	distance_lst(Tail,Length,Length_2).
    
%Функция для печати нескольких результатов
print_my([]).
print_my([X|Y]) :-
    write("Результат: "),write(X), nl,
    print_my(Y).
     
GOAL

	% readint - встроенная функиця для считывания с клавиатуры целого числа
	write("Введите значение элемента, которого желаете вставить: "),readint(E),
	write("Введите значение параметра 'i': "),readint(I),
	ins(1,I,E,[],[5,10,15,20,25,30,35,40,45,50],Ans),nl, %Для случая ввода с клавиатуры
	%Остальные примеры
	ins(1,1,100,[],[],Ans1),
	ins(1,2,100,[],[],Ans2),
	ins(1,2,100,[],[11,22,33,44,55,66,77,88,99],Ans3),
	ins(1,3,-1,[],[0,0,0,0,0,0,0,0,1],Ans4),
	ins(1,2,22,[],[0,0,0,0,0,0,0,0,0],Ans5),nl,
	print_my([Ans,Ans1,Ans2,Ans3,Ans4,Ans5]),nl.



DOMAINS
ilst = integer* %список, содержащий переменные типа int

PREDICATES
nondeterm length_lst(ilst, integer)
nondeterm distance_lst(ilst, integer, integer)

nondeterm power(integer, integer, integer)
nondeterm insert_in_lst(ilst, integer, integer, ilst)

nondeterm remove_from_lst(ilst, integer, ilst)

nondeterm get_element(ilst, integer, integer)

nondeterm swap_elements(ilst, integer, integer, ilst)

nondeterm list_steps(integer, ilst)
nondeterm list_steps_temp(integer, ilst)
nondeterm count_steps(integer, integer, integer) 
nondeterm value_step(integer,integer)

nondeterm sort_shell(ilst,ilst)
nondeterm sort_shell_steps(ilst,ilst,ilst)
nondeterm sort_shell_step(ilst,integer,ilst)
nondeterm sort_shell_step_value(ilst,integer,integer,integer,ilst)

CLAUSES
%Частные случаи
%Если список пустой
sort_shell([],[]):-!.

%Если список из одного элемента
sort_shell(List, List):-
	length_lst(List, Length),
	Length = 1,!.

%Если список состоит из двух элементов, где Element_1 < Element_2	
sort_shell([Element_1, Element_2|Tail],[Element_1, Element_2]):-
	length_lst([Element_1, Element_2|Tail],Length),
	Length = 2,
	Element_1 < Element_2,!.
	
%Если список состоит из двух элементов, где Element_1 > Element_2	
sort_shell([Element_1, Element_2|Tail],[Element_2,Element_1]):-
	length_lst([Element_1, Element_2|Tail],Length),
	Length = 2,
	Element_1 > Element_2,!.

%Сортировка Шелла
%С использованием метода для вычисления последовательности шагов сортировки,предложенным Дональдом Кнутом.
sort_shell(List,SortedList):-
	length_lst(List, Length),
	list_steps(Length, Steps),
	sort_shell_steps(List, Steps,SortedList),!.

%Дальше пойдут шаги сортировки
sort_shell_steps(SortedList,[],SortedList).
sort_shell_steps(List,[Head|Tail],SortedList):-
	sort_shell_step(List,Head,TempList),
	sort_shell_steps(TempList, Tail, SortedList).
	
	
sort_shell_step(List, ValueStep, Res):-
	sort_shell_step_value(List,ValueStep,0,ValueStep,Res).
	
	
		
sort_shell_step_value(Res, ValueStep, Numb_1, _, Res):-
	length_lst(Res, Length),
	Max = Numb_1 + ValueStep,
	Max >= Length.	

sort_shell_step_value(List, ValueStep, Numb_1, Numb_2, Res):-
	length_lst(List, Length),
	Numb_2 >= Length,
	Numb_3 = Numb_1 + 1,
	Numb_4 = Numb_3 + 1,
	sort_shell_step_value(List, ValueStep, Numb_3, Numb_4, Res).

sort_shell_step_value(List, ValueStep, Numb_1, Numb_2, Res):-
	get_element(List,Numb_1,Element_1),
	get_element(List,Numb_2,Element_2),
	Element_1 > Element_2,
	swap_elements(List,Numb_1,Numb_2,NewList),
	Numb_3 = Numb_2 + ValueStep,
	sort_shell_step_value(NewList,ValueStep, Numb_1, Numb_3, Res).
	
sort_shell_step_value(List, ValueStep, Numb_1, Numb_2, Res):-
	get_element(List,Numb_1,Element_1),
	get_element(List,Numb_2,Element_2),
	Element_1 <= Element_2,
	Numb_3 = Numb_2 + ValueStep,
	sort_shell_step_value(List,ValueStep, Numb_1, Numb_3, Res).
	
	
%Перестановка элементов в списке
swap_elements(List,Numb_1,Numb_2,NewList):-
	get_element(List,Numb_1, Element_1),
	get_element(List,Numb_2, Element_2),
	remove_from_lst(List,Numb_1,List_1),
	insert_in_lst(List_1,Element_2,Numb_1,List_2),
	remove_from_lst(List_2,Numb_2,List_3),
	insert_in_lst(List_3,Element_1,Numb_2,NewList).


%Правило для вычисления степени числа
power(_,0, 1):- !.
power(A,B, Pow):-
	B > 0, 0 <> B mod 2, !,
	TailB = B - 1,
	power(A, TailB, TailPow),
	Pow = TailPow * A.
power(A, B, Pow):-
	B > 0, 0 = B mod 2, !,
	TailB = B / 2,
	power(A, TailB, TailPow),
	Pow = TailPow * TailPow.	
power(A, B, Pow):-
	B1 = B * (-1),
	power(A, B1, Divider),
	Pow = 1/Divider.	

/*
Первый агрумент - исходный список
Второй аргумент - элемент, который хотим вставить
Третий агрумент - номер или место в списке, на которое хотим поставить данный элемент
Чётвертый агрумент - результат	
*/
%Правило для вставки элемента в список, индексация с нуля
insert_in_lst([],Element,0,[Element]).
insert_in_lst([Head|Tail],Element,0,[Element|[Head|Tail]]).
insert_in_lst([Head|Tail],Element,Numb,[Head|Tail_1]):-
		Numb_1 = Numb - 1,
		insert_in_lst(Tail,Element,Numb_1,Tail_1).
		
		
%Удаление элемента из списка, индексация с нуля		
remove_from_lst([_|Tail],0,Tail).		
remove_from_lst([Head|Tail],Numb,[Head|Tail_1]):-
	Numb_1 = Numb - 1,
	remove_from_lst(Tail,Numb_1,Tail_1).


%Получить значение элемента по индексу, индексация с нуля
get_element([Head|_],0,Head).
get_element([_|[Head_1|Tail]],Numb,Element):-
	Numb_1 = Numb - 1,
	get_element([Head_1|Tail],Numb_1,Element).

	
%Правила для вычисления длины списка
length_lst(List, Length):- 
	distance_lst(List, Length, 0).
	
distance_lst([], Length, Length).
distance_lst([_|Tail], Length, Length_1):-
	Length_2 = Length_1 + 1, 
	distance_lst(Tail, Length, Length_2).
	

%Правила для получения последовательности шагов
list_steps(Length, Steps) :-
	count_steps(Length, 2, CountSteps),
	list_steps_temp(CountSteps, Steps).

list_steps_temp(CountSteps, Steps) :-
	CountSteps > -1, !,
	value_step(CountSteps, Value),
	NewCountSteps = CountSteps - 1,
	list_steps_temp(NewCountSteps, StepsTail),
	Steps = [Value|StepsTail];
	Steps = [].
	
%Правило получения количества шагов сортировки
count_steps(Length, Start, Steps) :-
	Steps = Start - 2,
	power(3,Start, Power),
	Length < Power;
	NextStart = Start + 1,
	count_steps(Length, NextStart, Steps).	
	
%Получение значения шагов сортировки (смещение)
value_step(0, 1).
value_step(Step, Value) :-
	Step1 = Step - 1,
	value_step(Step1, Value1),
	Value = 3 * Value1 + 1.

GOAL
	sort_shell([],Ans1),
	sort_shell([22],Ans2),
	sort_shell([8,22],Ans3),
	sort_shell([13,1],Ans4),
	sort_shell([67, 1, 8, 3, -1, 5],Ans5),
	sort_shell([1,2,5, 22, 7, 1, 0, -1, 2, 2 , 5, 6], Ans6).
	
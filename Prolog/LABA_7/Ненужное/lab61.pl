%Если на входе пустой список
shell_sort([], []).

%Если на входе список из 1 элемента
shell_sort([H], [H]).

%Если на входе список из 2 элементов, второй элемент меньше
shell_sort([A, B|TAIL], [B, A]) :-
    length_list([A, B|TAIL], Length),
    Length = 2,
    A > B.

%Список из 2 элементов, первый элемент меньше
shell_sort([A, B|T], [A, B]) :-
    length_list([A, B|T], Length),
    Length = 2,
    A < B.

%Запуск сортировки Шелла.
shell_sort(List, Result) :-
    length_list(List, Length),
    list_steps(Length, Steps),
    shell_sort_steps(List, Steps, Result).

%Проход по шагам сортировки
shell_sort_steps(Result, [], Result).
shell_sort_steps(List, [H|T], Result) :-
    shell_sort_step(List, H, TempList),
    shell_sort_steps(TempList, T, Result).

%Шаг сортировки
shell_sort_step(List, Step, Result) :-
    shell_sort_step_value(List, Step, 0, Step, Result).

shell_sort_step_value(Result, Step, N1, _, Result) :-
    length_list(Result, Length),
    Max is (N1 + Step),
    Max >= Length.

shell_sort_step_value(List, Step, N1, N2, Result) :-
    length_list(List, Length),
    N2 >= Length,
    N3 is (N1 + 1),
    N4 is (N3 + 1),
    shell_sort_step_value(List, Step, N3, N4, Result).

shell_sort_step_value(List, Step, N1, N2, Result) :-
    get_element_list(List, N1, Element1),
    get_element_list(List, N2, Element2),
    Element1 > Element2,
    swap_elem(List, N1, N2, NewList),
    N3 is (N2 + Step),
    shell_sort_step_value(NewList, Step, N1, N3, Result).

shell_sort_step_value(List, Step, N1, N2, Result) :-
    get_element_list(List, N1, Element1),
    get_element_list(List, N2, Element2),
    Element1 =< Element2,
    N3 is (N2 + Step),
    shell_sort_step_value(List, Step, N1, N3, Result).

%Получение последовательности шагов
list_steps(Length, Steps) :-
    number_steps(Length, 2, NumberSteps),
	list_steps_temp(NumberSteps, Steps).

list_steps_temp(NumberSteps, Steps) :-
    NumberSteps > -1, !,
    step_value(NumberSteps, Value),
    NewNumberSteps is (NumberSteps - 1),
    list_steps_temp(NewNumberSteps, StepsTail),
    Steps = [Value|StepsTail];
    Steps = [].

%Количество шагов сортировки
number_steps(Length, Start, Steps) :-
    Steps is Start - 2,
	Length < 3 ^ Start;
    NextStart is Start + 1,
    number_steps(Length, NextStart, Steps).

%Значение шагов сортировки
step_value(0, 1).
step_value(Step, Value) :-
    Step1 is Step - 1,
    step_value(Step1, Value1),
    Value is 3 * Value1 + 1.

%Длина списка
length_list(List, Length):-
	length_list_temp(List, Length, 0).

length_list_temp([], Length, Length).
length_list_temp([_|T], Length, Length1) :-
  Length2 is (Length1 + 1),
  length_list_temp(T, Length, Length2).

%Получить значение элемента по индексу
get_element_list([H|_], 0, H).
get_element_list([_|[H1|T]], N, Element) :-
    N1 is (N - 1),
    get_element_list([H1|T], N1, Element).

%Перестановка элементов
swap_elem(List, N1, N2, NewList) :-
    get_element_list(List, N1, Element1),
    get_element_list(List, N2, Element2),
    delete_element_list(List, N1, List1),
    insert_element_list(List1, Element2, N1, List2),
    delete_element_list(List2, N2, List3),
    insert_element_list(List3, Element1, N2, NewList).

%Вставить элемент в список по индексу
insert_element_list([], Element, 0, [Element]).
insert_element_list([H|T], Element, 0, [Element|[H|T]]).
insert_element_list([H|T], Element, N, [H|T1]) :-
    N1 is (N - 1),
    insert_element_list(T, Element, N1, T1).

%Удалить элемент из списка по индексу
delete_element_list([_|T], 0, T).
delete_element_list([H|T], N, [H|T1]) :-
    N1 is (N - 1),
    delete_element_list(T, N1, T1).

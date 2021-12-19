%Если на входе пустой список, то добавлять ничего не надо.
ins([], _, _, []).
%Если длина списка меньше, чем указанный I, то добавлять ничего не нужно
ins(List, I, _, List) :-
    length(List, Length),
    Length < I.
/*Вставка в список элементов, находящихся на (i * n) – х местах, где i задается в качестве аргумента, а в n = 1, 2, 3, … элемента Element*/
ins(List, I, Element, Result) :-
    length(List, Length),
    get_number_insert(Length, I, 1, ListInsert),
    insert_list_elem(List, ListInsert, Element, Result).

%Получение списка индексов для вставки элемента
get_number_insert(Length, I, N, ListInsert) :-
    Length >= (I * N), !,
    Value is (I * N - 1),
    NewN is (N + 1),
    get_number_insert(Length, I, NewN, ListInsertTail),
    ListInsert = [Value|ListInsertTail];
    ListInsert = [].

%Удалить элементы по списку индексов
insert_list_elem(Result, [], _, Result).
insert_list_elem(List, [H|T], Element, Result) :-
    insert_elem_list(List, Element, H, TempList),
    insert_list_elem(TempList, T, Element, Result).

  insert_elem_list([], Elem, 0, [Elem]).
  insert_elem_list([H|T], Elem, 0, [Elem|[H|T]]).
  insert_elem_list([H|T], Elem, N, [H|T1]) :-
      N1 is (N - 1),
      insert_elem_list(T, Elem, N1, T1).


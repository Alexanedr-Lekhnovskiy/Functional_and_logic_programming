answer([HeadAnswer|TailAnswer]) :-
    list_number_1_10(L),
    permutation(L, [HeadAnswer|TailAnswer]),
    check_answer([HeadAnswer|TailAnswer], HeadAnswer).

%Список чисел от 1 до 10
list_number_1_10([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).

%Проверка на то, что суммы соседних чисел не делятся ни на 3, ни на 5, ни на 7.
check_answer([A], B):-
    SumAB is A + B,
    X is SumAB mod 3, X > 0,
    Y is SumAB mod 5, Y > 0,
    Z is SumAB mod 7, Z > 0.
check_answer([A, B|Tail], К):-
    SumAB is A + B,
    X is SumAB mod 3, X > 0,
    Y is SumAB mod 5, Y > 0,
    Z is SumAB mod 7, Z > 0,
    check_answer([B|Tail], К).

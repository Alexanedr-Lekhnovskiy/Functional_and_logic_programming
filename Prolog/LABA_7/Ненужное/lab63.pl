answer([HeadAnswer|TailAnswer]) :-
    list_number_1_10(L),
    permutation(L, [HeadAnswer|TailAnswer]),
    check_answer([HeadAnswer|TailAnswer], HeadAnswer).

%������ ����� �� 1 �� 10
list_number_1_10([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).

%�������� �� ��, ��� ����� �������� ����� �� ������� �� �� 3, �� �� 5, �� �� 7.
check_answer([A], B):-
    SumAB is A + B,
    X is SumAB mod 3, X > 0,
    Y is SumAB mod 5, Y > 0,
    Z is SumAB mod 7, Z > 0.
check_answer([A, B|Tail], �):-
    SumAB is A + B,
    X is SumAB mod 3, X > 0,
    Y is SumAB mod 5, Y > 0,
    Z is SumAB mod 7, Z > 0,
    check_answer([B|Tail], �).

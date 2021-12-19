game():-
    initial_state(State),
    next_move(State, 0).

%����� ���� ����
show(State) :-
    get_element(State, 0, SymbolA),
    get_element(State, 1, SymbolB),
    get_element(State, 2, SymbolC),
    get_element(State, 3, SymbolD),
    get_element(State, 4, SymbolE),
    get_element(State, 5, SymbolF),
    get_element(State, 6, SymbolG),
    get_element(State, 7, SymbolH),
    get_element(State, 8, SymbolI),
    symbol_to_number(SymbolA, NumberA),
    symbol_to_number(SymbolB, NumberB),
    symbol_to_number(SymbolC, NumberC),
    symbol_to_number(SymbolD, NumberD),
    symbol_to_number(SymbolE, NumberE),
    symbol_to_number(SymbolF, NumberF),
    symbol_to_number(SymbolG, NumberG),
    symbol_to_number(SymbolH, NumberH),
    symbol_to_number(SymbolI, NumberI),
    write("|"),
    write(NumberA),
    write("|"),
    write(NumberB),
    write("|"),
    write(NumberC),
    writeln("|"),
    write("|"),
    write(NumberD),
    write("|"),
    write(NumberE),
    write("|"),
    write(NumberF),
    writeln("|"),
    write("|"),
    write(NumberG),
    write("|"),
    write(NumberH),
    write("|"),
    write(NumberI),
    writeln("|").

%��������� ���������
initial_state([0,0,0,0,0,0,0,0,0]).

%0 - ��������� ����
symbol_to_number(0, ' ').
%1 - �������
symbol_to_number(1, 'x').
%2 - �����
symbol_to_number(2, 'o').

%�������� ����, ��� ������ ���� ��������
is_free(X, Y, State) :-
    N is (Y * 3 + X),
    get_element(State, N, A),
    A = 0.

%���������� ����
make_move(X, Y, State, Symbol, State_next) :-
    is_free(X, Y, State),
    N is (Y * 3 + X),
    delete_element(State, N, State1),
    insert_element(State1, Symbol, N, State_next).

%�������� ����, ��� �������� ��������
check_state(State) :-
    state_win_x(StateX),
    member(State, [StateX]),
    writeln("�������� ��������(������ ������)"), !. %��������� ������������ ��� �������� ������� �� ��, ��� ������� ������ ������� ��� ��������� �������� �����������;

%�������� ����, ��� �������� ������
check_state(State) :-
    state_win_o(StateO),
    member(State, [StateO]),
    writeln("������ ��������(�������� ������)"), !. %��������� ������������ ��� �������� ������� �� ��, ��� ������� ������ ������� ��� ��������� �������� �����������;

%�������� ����, ��� ���� ����������� ������
check_state(State) :-
    not(member(0, State)),
    writeln("�����"), !. %��������� ������������ ��� �������� ������� �� ��, ��� ������� ������ ������� ��� ��������� �������� �����������;

%��� ������
next_move(State, N) :-
    I is (N mod 2), I = 0,
    Symbol is 1,
    show(State),
    writeln("������� ����� ������� ������ ���� (0 1 2)"),
    read(X),
    writeln("������� ����� ������ ������ ���� (0 1 2)"),
    read(Y),
    make_move(X, Y, State, Symbol, NewState), !, % ����� ��������� ������������ ��� ����������� �������� ���������� � �������� ��������� �������.
    not(check_state(NewState)),
    N1 is (N + 1),
    next_move(NewState, N1).

%��������� ���.
next_move(State, N) :-
    I is (N mod 2), I = 1,
    Symbol is 2,
    next_move_o(State, X, Y),
    make_move(X, Y, State, Symbol, NewState), !, % ����� ��������� ������������ ��� ����������� �������� ���������� � �������� ��������� �������.
    not(check_state(NewState)),
    N1 is (N + 1),
    next_move(NewState, N1).

%�������� �������� ����, ����� ��������� �������� (������ ������)
state_win_x([1,1,1,_,_,_,_,_,_]).
state_win_x([_,_,_,1,1,1,_,_,_]).
state_win_x([_,_,_,_,_,_,1,1,1]).
state_win_x([1,_,_,1,_,_,1,_,_]).
state_win_x([_,1,_,_,1,_,_,1,_]).
state_win_x([_,_,1,_,_,1,_,_,1]).
state_win_x([1,_,_,_,1,_,_,_,1]).
state_win_x([_,_,1,_,1,_,1,_,_]).

%�������� �������� ����, ����� ��������� ������ (�������� ������)
state_win_o([2,2,2,_,_,_,_,_,_]).
state_win_o([_,_,_,2,2,2,_,_,_]).
state_win_o([_,_,_,_,_,_,2,2,2]).
state_win_o([2,_,_,2,_,_,2,_,_]).
state_win_o([_,2,_,_,2,_,_,2,_]).
state_win_o([_,_,2,_,_,2,_,_,2]).
state_win_o([2,_,_,_,2,_,_,_,2]).
state_win_o([_,_,2,_,2,_,2,_,_]).

%��������� �������� �� �������
get_element([Head|_], 0, Head).
get_element([_|[Head1|Tail]], N, Element) :-
    N1 is (N - 1),
    get_element([Head1|Tail], N1, Element).

%������� �������� �� �������
insert_element([], Element, 0, [Element]).
insert_element([Head|Tail], Element, 0, [Element|[Head|Tail]]).
insert_element([Head|Tail], Element, N, [Head|Tail1]) :-
    N1 is (N-1),
    insert_element(Tail, Element, N1, Tail1) .

%�������� �������� �� �������
delete_element([_|Tail], 0, Tail).
delete_element([Head|Tail], N, [Head|Tail1]) :-
    N1 is (N - 1),
    delete_element(Tail, N1, Tail1).

%*********************************
%��� ��������� ��������� ������������ ��� �������� ������� �� ��, ��� ������� ������ ������� ��� ��������� �������� �����������;
%*********************************

%���� ����� �� �����, �� �������� ���. (������� �������� ���: 1) ��� ���� �������, ��� �� ������
next_move_o([_, _,_, _, 0, _, _, _, _], 1, 1) :- !.

%��������� ��������, ��� �������, ������ ��� �������� ����������,����� �������� �������� �������. (������� �������� ���: 2)
next_move_o([0,2,2,_,_,_,_,_,_], 0, 0) :- !.
next_move_o([2,0,2,_,_,_,_,_,_], 1, 0) :- !.
next_move_o([2,2,0,_,_,_,_,_,_], 2, 0) :- !.

next_move_o([_,_,_,0,2,2,_,_,_], 0, 1) :- !.
next_move_o([_,_,_,2,0,2,_,_,_], 1, 1) :- !.
next_move_o([_,_,_,2,2,0,_,_,_], 2, 1) :- !.

next_move_o([_,_,_,_,_,_,0,2,2], 0, 2) :- !.
next_move_o([_,_,_,_,_,_,2,0,2], 1, 2) :- !.
next_move_o([_,_,_,_,_,_,2,2,0], 2, 2) :- !.

next_move_o([0,_,_,2,_,_,2,_,_], 0, 0) :- !.
next_move_o([2,_,_,0,_,_,2,_,_], 0, 1) :- !.
next_move_o([2,_,_,2,_,_,0,_,_], 0, 2) :- !.

next_move_o([_,0,_,_,2,_,_,2,_], 1, 0) :- !.
next_move_o([_,2,_,_,0,_,_,2,_], 1, 1) :- !.
next_move_o([_,2,_,_,2,_,_,0,_], 1, 2) :- !.

next_move_o([_,_,0,_,_,2,_,_,2], 2, 0) :- !.
next_move_o([_,_,2,_,_,0,_,_,2], 2, 1) :- !.
next_move_o([_,_,2,_,_,2,_,_,0], 2, 2) :- !.

next_move_o([0,_,_,_,2,_,_,_,2], 0, 0) :- !.
next_move_o([2,_,_,_,0,_,_,_,2], 1, 1) :- !.
next_move_o([2,_,_,_,2,_,_,_,0], 2, 2) :- !.

next_move_o([_,_,0,_,2,_,2,_,_], 2, 0) :- !.
next_move_o([_,_,2,_,0,_,2,_,_], 1, 1) :- !.
next_move_o([_,_,2,_,2,_,0,_,_], 0, 2) :- !.


%��������� ��������, � ������� ����� ������������� ������� ���������� (������� �������� ���: 3)
next_move_o([0,1,1,_,_,_,_,_,_], 0, 0) :- !.
next_move_o([1,0,1,_,_,_,_,_,_], 1, 0) :- !.
next_move_o([1,1,0,_,_,_,_,_,_], 2, 0) :- !.

next_move_o([_,_,_,0,1,1,_,_,_], 0, 1) :- !.
next_move_o([_,_,_,1,0,1,_,_,_], 1, 1) :- !.
next_move_o([_,_,_,1,1,0,_,_,_], 2, 1) :- !.

next_move_o([_,_,_,_,_,_,0,1,1], 0, 2) :- !.
next_move_o([_,_,_,_,_,_,1,0,1], 1, 2) :- !.
next_move_o([_,_,_,_,_,_,1,1,0], 2, 2) :- !.

next_move_o([0,_,_,1,_,_,1,_,_], 0, 0) :- !.
next_move_o([1,_,_,0,_,_,1,_,_], 0, 1) :- !.
next_move_o([1,_,_,1,_,_,0,_,_], 0, 2) :- !.

next_move_o([_,0,_,_,1,_,_,1,_], 1, 0) :- !.
next_move_o([_,1,_,_,0,_,_,1,_], 1, 1) :- !.
next_move_o([_,1,_,_,1,_,_,0,_], 1, 2) :- !.

next_move_o([_,_,0,_,_,1,_,_,1], 2, 0) :- !.
next_move_o([_,_,1,_,_,0,_,_,1], 2, 1) :- !.
next_move_o([_,_,1,_,_,1,_,_,0], 2, 2) :- !.

next_move_o([0,_,_,_,1,_,_,_,1], 0, 0) :- !.
next_move_o([1,_,_,_,0,_,_,_,1], 1, 1) :- !.
next_move_o([1,_,_,_,1,_,_,_,0], 2, 2) :- !.

next_move_o([_,_,0,_,1,_,1,_,_], 2, 0) :- !.
next_move_o([_,_,1,_,0,_,1,_,_], 1, 1) :- !.
next_move_o([_,_,1,_,1,_,0,_,_], 0, 2) :- !.

%���� ����� �����, �� �������� ����� ������� ����. (������� �������� ���: 4)
next_move_o([0, _,_, _, 1, _, _, _, _], 0, 0):- !.

%���� ����� ������ �� (o), � ����� ����� ���� �� ������� �������, �� ������ ��������� ������� (������� �������� ���: 5)
next_move_o([0, _, _, _, 2, _, _, _, 1], 0, 0):- !.
next_move_o([_, _, 1, _, 2, _, 0, _, _], 0, 2):- !.
next_move_o([_, _, 0, _, 2, _, 1, _, _], 2, 0):- !.
next_move_o([1, _, _, _, 2, _, _, _, 0], 2, 2):- !.

%� ��������� ������� �������� ��������� ���� (������� �������� ���: 6)
next_move_o(_, 0, 0).
next_move_o(_, 0, 2).
next_move_o(_, 2, 0).
next_move_o(_, 2, 2).
next_move_o(_, 0, 1).
next_move_o(_, 1, 0).
next_move_o(_, 1, 1).
next_move_o(_, 1, 2).
next_move_o(_, 2, 1).

%���� ����� ������ �� (o), � ����� ����� ���� �� ������� ������� (������� �������� ���: 5)
next_move_o([0, _, _, _, 2, _, _, _, 1], 0, 0):- !.
next_move_o([_, _, 1, _, 2, _, 0, _, _], 0, 2):- !.
next_move_o([_, _, 0, _, 2, _, 1, _, _], 2, 0):- !.
next_move_o([1, _, _, _, 2, _, _, _, 0], 2, 2):- !.
next_move_o([_, 0,_, _, 2, _, _, _, 1], 1, 0) :- !.
next_move_o([_, 0,1, _, 2, _, _, _, _], 1, 0) :- !.
next_move_o([_, 0,_, _, 2, _, 1, _, _], 1, 0) :- !.
next_move_o([1, 0,_, _, 2, _, _, _, _], 1, 0) :- !.

%� ��������� ������� �������� ��������� ���� (������� �������� ���: 6)
next_move_o(_, 0, 0).
next_move_o(_, 1, 0).
next_move_o(_, 2, 0).
next_move_o(_, 1, 0).
next_move_o(_, 1, 1).
next_move_o(_, 1, 2).
next_move_o(_, 2, 0).
next_move_o(_, 2, 1).
next_move_o(_, 2, 2).


:- use_module(library(pce)).

%Окно старта игры
game_menu():-
    new(Main, dialog('Крестики-нолики')),
    new(Start,button('Начать игру', message(@prolog, game))),
    new(Exit,button('Выход', message(Main, destroy))),
    send(Main, append, Start),
    send(Main, append, Exit, below),
    send(Main, open).

%Окно игры
game() :-
    new(Game, dialog('Игра')),
    new(Field1, button('X')),
    new(Field2, button('X')),
    new(Field3, button('X')),
    new(Field4, button('X')),
    new(Field5, button('X')),
    new(Field6, button('X')),
    new(Field7, button('X')),
    new(Field8, button('X')),
    new(Field9, button('X')),

    new(Click1,button('1', message(@prolog, change, Field1, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click2,button('2', message(@prolog, change, Field2, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click3,button('3', message(@prolog, change, Field3, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click4,button('4', message(@prolog, change, Field4, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click5,button('5', message(@prolog, change, Field5, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click6,button('6', message(@prolog, change, Field6, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click7,button('7', message(@prolog, change, Field7, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click8,button('8', message(@prolog, change, Field8, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),
    new(Click9,button('9', message(@prolog, change, Field9, Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9))),

    send(Game, append, Field1),
    send(Game, append, Field2, right),
    send(Game, append, Field3, right),
    send(Game, append, Click1, below),
    send(Game, append, Click2, right),
    send(Game, append, Click3, right),
    send(Game, append, Field4, below),
    send(Game, append, Field5, right),
    send(Game, append, Field6, right),
    send(Game, append, Click4, below),
    send(Game, append, Click5, right),
    send(Game, append, Click6, right),
    send(Game, append, Field7, below),
    send(Game, append, Field8, right),
    send(Game, append, Field9, right),
    send(Game, append, Click7, below),
    send(Game, append, Click8, right),
    send(Game, append, Click9, right),
    send(Game, open),
    game1([Field1, Field2, Field3, Field4, Field5, Field6, Field7, Field8, Field9]).

%Начально состояние
game1(ListField) :-
    change_field(ListField, [0,0,0,0,0,0,0,0,0]).

%0 - Незанятое поле
symbol_to_number(0, ' ').
%1 - крестик
symbol_to_number(1, 'X').
%2 - нолик
symbol_to_number(2, 'O').

%Изменение состояния полей FieldN
change_field(ListField, State) :-
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
    get_element(ListField, 0, A),
    get_element(ListField, 1, B),
    get_element(ListField, 2, C),
    get_element(ListField, 3, D),
    get_element(ListField, 4, E),
    get_element(ListField, 5, F),
    get_element(ListField, 6, G),
    get_element(ListField, 7, H),
    get_element(ListField, 8, I),
    send(A, name, NumberA),
    send(B, name, NumberB),
    send(C, name, NumberC),
    send(D, name, NumberD),
    send(E, name, NumberE),
    send(F, name, NumberF),
    send(G, name, NumberG),
    send(H, name, NumberH),
    send(I, name, NumberI).

change(X, A, B, C, D, E, F, J, H, I) :-
    get(X, name, X1),
    symbol_to_number(N, X1),
    N = 0,
    send(X, name, 'X'),
    get_state([A, B, C, D, E, F, J, H, I], State), !, % Здесь отсечение используется для прекращения процесса порождения и проверки возможных решений.
    not(check(State)),
    Symbol is 2,
    next_move_o(State, X0, Y0),
    make_move(X0, Y0, State, Symbol, NewState), !, % Здесь отсечение используется для прекращения процесса порождения и проверки возможных решений.
    change_field([A, B, C, D, E, F, J, H, I], NewState),
    not(check(NewState)).

%Проверка того, что поле свободно.
is_free(X, Y, State) :-
    N is (Y * 3 + X),
    get_element(State, N, A),
    A = 0.

%Выполнение хода
make_move(X, Y, State, Symbol, State_next) :-
    is_free(X, Y, State),
    N is Y*3+X,
    delete_element(State, N, State1),
    insert_element(State1, Symbol, N, State_next).

%Проверка того, что победили крестики
check(State) :-
    state_win_x(StateX),
    member(State, [StateX]),
    new(Dialog, dialog("Результат")),
    new(F, text("Крестики победили(Победа игрока)")),
    send(Dialog, append, F),
    send(Dialog, open), !. %Отсечение используется для указания Прологу на то, что найдено нужное правило для заданного целевого утверждения;

%Проверка того, что победили нолики
check(State) :-
    state_win_o(StateO),
    member(State, [StateO]),
    new(Dialog, dialog("Результат")),
    new(F, text("Нолики победили(Проигрыш игрока)")),
    send(Dialog, append, F),
    send(Dialog, open), !. %Отсечение используется для указания Прологу на то, что найдено нужное правило для заданного целевого утверждения;

%Проверка того, что игра закончилась ничьей
check(State) :-
    not(member(0, State)),
    new(Dialog, dialog("Ничья")),
    new(F, text("Ничья")),
    send(Dialog, append, F),
    send(Dialog, open),!. %Отсечение используется для указания Прологу на то, что найдено нужное правило для заданного целевого утверждения;

%Варианты ситуаций игры, когда побеждают крестики (Победа игрока)
state_win_x([1,1,1,_,_,_,_,_,_]).
state_win_x([_,_,_,1,1,1,_,_,_]).
state_win_x([_,_,_,_,_,_,1,1,1]).
state_win_x([1,_,_,1,_,_,1,_,_]).
state_win_x([_,1,_,_,1,_,_,1,_]).
state_win_x([_,_,1,_,_,1,_,_,1]).
state_win_x([1,_,_,_,1,_,_,_,1]).
state_win_x([_,_,1,_,1,_,1,_,_]).

%Варианты ситуаций игры, когда побеждают нолики (Проигрыш игрока)
state_win_o([2,2,2,_,_,_,_,_,_]).
state_win_o([_,_,_,2,2,2,_,_,_]).
state_win_o([_,_,_,_,_,_,2,2,2]).
state_win_o([2,_,_,2,_,_,2,_,_]).
state_win_o([_,2,_,_,2,_,_,2,_]).
state_win_o([_,_,2,_,_,2,_,_,2]).
state_win_o([2,_,_,_,2,_,_,_,2]).
state_win_o([_,_,2,_,2,_,2,_,_]).

%Получение состояния
get_state(ListField, [A, B, C, D, E, F, G, H, I]) :-
    get_element(ListField, 0, A2),
    get_element(ListField, 1, B2),
    get_element(ListField, 2, C2),
    get_element(ListField, 3, D2),
    get_element(ListField, 4, E2),
    get_element(ListField, 5, F2),
    get_element(ListField, 6, G2),
    get_element(ListField, 7, H2),
    get_element(ListField, 8, I2),
    get(A2, name, A1),
    get(B2, name, B1),
    get(C2, name, C1),
    get(D2, name, D1),
    get(E2, name, E1),
    get(F2, name, F1),
    get(G2, name, G1),
    get(H2, name, H1),
    get(I2, name, I1),
    symbol_to_number(A, A1),
    symbol_to_number(B, B1),
    symbol_to_number(C, C1),
    symbol_to_number(D, D1),
    symbol_to_number(E, E1),
    symbol_to_number(F, F1),
    symbol_to_number(G, G1),
    symbol_to_number(H, H1),
    symbol_to_number(I, I1).

%Получение элемента по индексу
get_element([Head|_], 0, Head).
get_element([_|[Head1|Tail]], N, Element) :-
    N1 is (N - 1),
    get_element([Head1|Tail], N1, Element).

%Вставка элемента по индексу
insert_element([], Element, 0, [Element]).
insert_element([Head|Tail], Element, 0, [Element|[Head|Tail]]).
insert_element([Head|Tail], Element, N, [Head|Tail1]) :-
    (N1 is N - 1),
    insert_element(Tail, Element, N1, Tail1).

%Удаление элемента по индексу
delete_element([_|Tail], 0, Tail).
delete_element([Head|Tail], N, [Head|Tail1]) :-
    N1 is (N - 1),
    delete_element(Tail, N1, Tail1).


%*********************************
%Все следующие отсечения используются для указания Прологу на то, что найдено нужное правило для заданного целевого утверждения;
%*********************************


%Если центр не занят, то занимаем его. (Уровень важности ход: 1) Чем ниже уровень, тем он важнее
next_move_o([_, _,_, _, 0, _, _, _, _], 1, 1) :- !.

%Возможные ситуации, при которых, данный ход является выигрышным,тогда занимаем победную позицию. (Уровень важности ход: 2)
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

%Возможные ситуации, в которой нужно предотвратить выигрыш противника (Уровень важности ход: 3)
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

%Если центр занят, то занимает левый верхний угол. (Уровень важности ход: 4)
next_move_o([0, _,_, _, 1, _, _, _, _], 0, 0):- !.

%Если центр заняли мы (o), а игрок занял одну из угловых позиций, то занять следующию позицию (Уровень важности ход: 5)
next_move_o([0, _, _, _, 2, _, _, _, 1], 0, 0):- !.
next_move_o([_, _, 1, _, 2, _, 0, _, _], 0, 2):- !.
next_move_o([_, _, 0, _, 2, _, 1, _, _], 2, 0):- !.
next_move_o([1, _, _, _, 2, _, _, _, 0], 2, 2):- !.

%В остальных случаях возможны следующие ходы (Уровень важности ход: 6)
next_move_o(_, 0, 0).
next_move_o(_, 0, 2).
next_move_o(_, 2, 0).
next_move_o(_, 2, 2).
next_move_o(_, 0, 1).
next_move_o(_, 1, 0).
next_move_o(_, 1, 1).
next_move_o(_, 1, 2).
next_move_o(_, 2, 1).

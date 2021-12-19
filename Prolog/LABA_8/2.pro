DOMAINS
state = state(integer,integer,string)
history = state*
ilst = integer*

PREDICATES
start(string,history)
nondeterm solve(history,history)

initial_state(string,history)
final_state(history)

nondeterm new_state(state,state)
nondeterm possible_move(integer,integer)
nondeterm possible_state(integer,integer)

move(state,state,state)

nondeterm member(integer,ilst)
nondeterm member(state,history)

nondeterm print_lst_col(history)

CLAUSES

%������ ��������� ������ ��������
print_lst_col([]).
print_lst_col([Head|Tail]):-
	write(Head),nl,print_lst_col(Tail).
	
	
%������ ���������
start(Begin, Moves) :-
	initial_state(Begin, State),
	solve(State, Moves),!.

solve([NewState|ListState], [LastMove|TailMove]) :-
    new_state(NewState, NextState),
    not(member(NextState, ListState)),
    move(NewState, NextState, LastMove),
    solve([NextState, NewState|ListState], TailMove).
    
%��������� ������ ���������
solve(State, []):-
    final_state(State).

%��������� ���������
initial_state("��������� ��������� : ��� ��������� �� ����� ������", [state(3, 3, "����� �����")]).
%������� ���������
final_state([state(0, 0, "������ �����")|_]).


%�������� � ������ ������ �� ������
move(state(M1, K1, "����� �����"), state(M2, K2, "������ �����"), state(M, K, "�� ������ �����")) :-
    M = (M1 - M2),
    K = (K1 - K2).

%�������� � ������� ������ �� �����
move(state(M1, K1, "������ �����"), state(M2, K2, "����� �����"), state(M, K, "�� ����� �����")) :-
    M = (M2 - M1),
    K = (K2 - K1).


%������� ���� ��������� ��������� ���������� ���������� � ����������� �� ����� (0-1,1-0,1-1,2-0,0-2)
possible_move(M, K):-
    member(M, [0, 1, 2]),
    member(K, [0, 1, 2]),
    (M + K) <= 2,
    (M + K) > 0.


/*�������� ����, ��� �� ������ �������� ���������� �� ������ , ��� ����������� � ��������*/
possible_state(X, Y) :-
    X = Y;
    X = 0;
    Y = 0.


%����� ��������� ��� ����������� �� ������ �����
new_state(state(Missioner_1, Cannibal_1, "����� �����"), state(Missioner1_2, Cannibal_2, "������ �����")) :-
    possible_move(Missioner, Cannibal),
    Missioner <= Missioner_1,
    Cannibal <= Cannibal_1,
    Missioner1_2 = (Missioner_1 - Missioner),
    Cannibal_2 = (Cannibal_1 - Cannibal),
    possible_state(Missioner1_2, Cannibal_2).


%����� ��������� ��� ����������� �� ����� �����
new_state(state(Missioner_1, Cannibal_1, "������ �����"), state(Missioner1_2, Cannibal_2, "����� �����")) :-
    possible_move(Missioner, Cannibal),
    Missioner1_2 = (Missioner_1 + Missioner),
    Cannibal_2 = (Cannibal_1 + Cannibal),
    Missioner1_2 <= 3,
    Cannibal_2 <= 3,
    MR = (3 - Missioner1_2),
    KR = (3 - Cannibal_2),
    possible_state(MR, KR).


%����������� �������������� ������
member(Head,[Head|_]). 	
member(Head,[_|Tail]):- member(Head,Tail).

GOAL

	start(Begin, Moves),print_lst_col(Moves),nl.
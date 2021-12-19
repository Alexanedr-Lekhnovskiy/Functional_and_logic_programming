DOMAINS
il=integer*   ill=il*   illl=ill*

CONSTANTS
domino=[[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[2,2],[2,3],[2,4],[2,5],[2,6],[3,3],[3,4],[3,5],[3,6],[4,4],[4,5],[4,6],[5,5],[5,6],[6,6]]

PREDICATES
nondeterm piramida(integer,ill,illl)
nondeterm getStr(integer,integer,ill,ill,ill,ill)
nondeterm mem(ill,il,ill)
print_lst_col(illl)

CLAUSES
piramida(_,[],[]):- !.
piramida(A,B,[C|D]):- getStr(A,0,[],C,B,E), F=A+1, piramida(F,E,D).

%������ �� ������� ��������
%������ �������� - ���������� ���������, � �������� �������� � ������ ������
%������ ������� - ����� �������� ������ � ������ ������
getStr(0,A,B,B,C,C):- !, D=sqrt(A), D=round(D). %��� ���������� �������:"� ������ ������� ����� ����� �� ��������� ������ ���� ������ ���������"
getStr(A,0,[],B,C,D):- mem(C,[X,Y],E), F=X+Y, G=A-1, getStr(G,F,[[X,Y]],B,E,D).
%� �������� �������� ������������ �������� �������� ���� � ������: 0 � 0, 1 � 1 � �. �.
getStr(A,B,[[C,D]|E],F,G,H):- mem(G,[I,C],J), S=B+I+C, W=A-1, getStr(W,S,[[I,C],[C,D]|E],F,J,H).


%������� mem �������� ���� �������� � ���������� ������ �� ����������
mem([A|B],A,B).
mem([[A,B]|C],[B,A],C):- A<>B. %���� � �������� ������ �����, �� ������������� � ������ ������� ([1,0] � [0,1], ...)
mem([A|B],C,[A|D]):- mem(B,C,D). %������������� � ������ ��������

%������ ������ �������
print_lst_col([]).
print_lst_col([Head|Tail]):-
	write(Head),nl,print_lst_col(Tail).

GOAL
    piramida(1,domino,Piramida),!,print_lst_col(Piramida).
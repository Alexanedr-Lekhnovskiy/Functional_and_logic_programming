
PREDICATES
nondeterm who_likes_what(symbol,symbol)
nondeterm common_interests(symbol,symbol)

CLAUSES
%�����
who_likes_what(ivan, programming).
who_likes_what(ivan, reading).
who_likes_what(mary, reading).

%������� (����������:- ���1, ���2, ... , ���N)
%���� ���������� �������, �� ������� � ��� �������
common_interests(X,Y):- 
	who_likes_what(X,Z),who_likes_what(Y,Z), Y<>X.

GOAL

%who_likes_what(ivan, X).
%who_likes_what(ivan, X),who_likes_what(mary, X).
common_interests(X, Y).
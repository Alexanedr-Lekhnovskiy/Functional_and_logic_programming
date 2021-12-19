
PREDICATES
nondeterm who_likes_what(symbol,symbol)
nondeterm common_interests(symbol,symbol)

CLAUSES
%Факты
who_likes_what(ivan, programming).
who_likes_what(ivan, reading).
who_likes_what(mary, reading).

%Правила (заключение:- усл1, усл2, ... , услN)
%Если заключение истинно, ТО истинны и все условия
common_interests(X,Y):- 
	who_likes_what(X,Z),who_likes_what(Y,Z), Y<>X.

GOAL

%who_likes_what(ivan, X).
%who_likes_what(ivan, X),who_likes_what(mary, X).
common_interests(X, Y).
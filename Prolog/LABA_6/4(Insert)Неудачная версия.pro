domains
ilist=integer* %������, ��������� �� ���������� ���� integer
anslst= ilist*
 
predicates
readlist(integer,ilist).
ins(integer,integer,integer,ilist,ilist,ilist).
nondeterm member(integer,ilist).
print_my(anslst)
 
clauses
member(H,[H|_]).
member(H,[_|Tail]):- member(H,Tail).
 

%readlist - ��������� ������ ��������
readlist(0,[]):-!.
readlist(N,[E|Tail]):- readint(E),N1=N-1,readlist(N1,Tail).

%� - ������ �������� ������,������� � �������
ins(K,I,E,Numbers,L,[E|Tail]):-
    member(N,Numbers),K=N*I,!,K1=K+1,ins(K1,I,E,Numbers,L,Tail). % ��� ������, ����� �� ����� �� ����� ������� n*i
ins(K,I,E,Numbers,[H|Tail],[H|Tail1]):- K1=K+1,ins(K1,I,E,Numbers,Tail,Tail1). %��� ������, ����� �� �� ����� �� ������� �����, � ������ ��� ������ �� ������
ins(_,_,_,_,[],[]). 

print_my([]).
print_my([X|Y]) :-
    write(X), nl,
    print_my(Y).
goal
	% readint - ���������� ������� ��� ���������� � ���������� ������ �����
	write("������� ���������� �������� ��������� 'n': "),readint(Q), 
	write("������� ������ �������� ��� ��������� 'n':\n"),readlist(Q,Numbers),
	write("������� �������� ��������, �������� ������� ��������: "),readint(E),
	write("������� �������� ��������� 'i': "),readint(I),
	ins(1,I,E,Numbers,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],Ans),nl, %��� ������ ����� � ����������
	%��������� �������
	ins(1,1,100,[1,3],[],Ans1),
	ins(1,2,100,[1,3],[],Ans2),
	ins(1,2,100,[1,3,4],[11,22,33,44,55,66,77,88,99],Ans3),
	ins(1,3,-1,[1,2,3,4,5],[0,0,0,0,0,0,0,0,1],Ans4),
	ins(1,2,22,[1,2,3,4,5,6,7,8],[0,0,0,0,0,0,0,0,0],Ans5),nl,
	print_my([Ans,Ans1,Ans2,Ans3,Ans4,Ans5]),nl.
	
	
	
	
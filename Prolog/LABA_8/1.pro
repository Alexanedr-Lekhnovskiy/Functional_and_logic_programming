DOMAINS
slst = string*
wgc = wgc(string,slst,slst)
history = wgc*

PREDICATES
nondeterm member(wgc,history) % определение принадлежности списку
nondeterm member(string,slst)

initial_state(wgc)% Начальное состояние
final_state(wgc)% Конечное состояние

nondeterm move(wgc, string) % Определение возможности перехода
nondeterm update(wgc, string,wgc) % Поиск состояния, достижимого из заданного
update_boat(string, string)% Изменение местонахождения лодки
nondeterm select(string, slst, slst)% Выбор груза для перевозки 
nondeterm precedes(string, string) % Порядок сортировки
nondeterm insert(string, slst, slst) % Вставка элемента

nondeterm update_banks(string, string, slst, slst, slst, slst) % Перевозка

legal(wgc)%Допустимость состояния
nondeterm illegal(slst)%Недопустимые состояния

nondeterm solve_dfs(wgc, history, slst) % Построение последовательности состояний 
test_dfs(slst) % Поиск в графе поиском в глубину

CLAUSES


%Определение принадлежности списку
member(Head,[Head|_]). 	
member(Element,[_|Tail]):- member(Element,Tail).

%Начальное и конечное состояние
initial_state(wgc("Лодка на левом берегу.",["Волк","Коза","Капуста"],[])). 
final_state(wgc("Лодка на правом берегу.",[],["Волк","Коза","Капуста"])).

%Определение возможности перехода из состояния в состояние 	
move(wgc("Лодка на левом берегу.",L,R),Cargo):- member(Cargo,L). 
move(wgc("Лодка на правом берегу.",L,R),Cargo):- member(Cargo,R). 
move(wgc(B,L,R),"Без груза").

%Поиск состояния, достижимого из заданного
update(wgc(B,L,R),Cargo,wgc(B1,L1,R1)):- 
	update_boat(B,B1), 	
	update_banks(Cargo,B,L,R,L1,R1).

%Изменение местонахождения лодки 	
update_boat("Лодка на левом берегу.","Лодка на правом берегу."). 
update_boat("Лодка на правом берегу.","Лодка на левом берегу.").

%Выбор груза для перевозки 
select(X,[X|T],T). 
select(X,[H|T],[H|D]):- select(X,T,D).

%Порядок сортировки 
precedes("Волк",X). 
precedes(X,"Капуста").

%Вставка элемента в список
insert(X,[Y|Ys],[X,Y|Ys]):- precedes(X,Y). 
insert(X,[Y|Ys],[Y|Zs]):- precedes(Y,X),insert(X,Ys,Zs). 	
insert(X,[],[X]). 	


%Перевозка
%Изменение состава обитателей берегов
%Первый аргумент - перевозимый в лодке груз
%Второй аргумент - текущее местонахождение лодки (левый или правый берег)
%Третий и четвертый аргументы - текущее состав обитателей левого и правого берега
%Пятый и шестой аргументы - новый состав правого и левого берега

%Ситуация, когда фермер переправляется через реку без груза
update_banks("Без груза",B,L,R,L,R).

%Ситуация перевозка обитателей одного берега на другой
update_banks(Cargo,"Лодка на левом берегу.",L,R,L1,R1):- 
	select(Cargo,L,L1),insert(Cargo,R,R1).

update_banks(Cargo,"Лодка на правом берегу.",L,R,L1,R1):- 
	select(Cargo,R,R1),insert(Cargo,L,L1).


%Допустимость состояния
legal(wgc("Лодка на левом берегу.",L,R)):- 
	not(illegal(R)).

legal(wgc("Лодка на правом берегу.",L,R)):- 	
	not(illegal(L)).

illegal(List):- 	
	member("Волк",List), 	
	member("Коза",List).

illegal(List):- 
	member("Коза",List), 	
	member("Капуста",List).
	

%Построение посоедовательности состояний
solve_dfs(State,History,[]):- 	
	final_state(State).

solve_dfs(State, History, [Move|Moves]) :-
	move(State, Move),
	update(State, Move, State1),
	legal(State1),
	not(member(State1, History)),
	solve_dfs(State1, [State1|History], Moves).
	

% Поиск в глубину в графе
test_dfs(Moves):-
	initial_state(State),
	solve_dfs(State, [State], Moves),!.

GOAL
	test_dfs(Result).



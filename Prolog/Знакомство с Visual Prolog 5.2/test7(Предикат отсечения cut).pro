PREDICATES
	nondeterm findcar(symbol, symbol)
	nondeterm car(symbol, symbol, integer)
	nondeterm color(symbol, symbol)
	
CLAUSES
	/* '!' - ���������, ���������� ����������� ������� �������������� �������� */
	/*findcar(Model, Color):- car(Model,Color,Price), color(Color,"�������"),!,Price < 25000. */
	findcar(Model, Color):- car(Model,Color,Price), color(Color,"������"),!,Price < 25000.
	
	car("�������","�����",12000). 
	car("������","������",26000).
	car("������","�����",24000).
	car("�����","�����",20000).
	car("����","������",20000).
	
	color("�����", "������").
	color("������", "�������").
	
GOAL
	findcar(X,Y).
	
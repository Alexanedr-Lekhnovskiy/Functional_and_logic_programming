PREDICATES
	nondeterm gorod(string)
	show

CLAUSES
	gorod("������").
	gorod("�����").
	gorod("����").
	gorod("����").
	
	show:- gorod(X),write(X),nl,fail.   /*fail-������ �����, write � nl - �������� ���������(��� �����������)*/
	show.   /*��� ���� ������� ��� show ������ "no", � � ��� "yes" */
	
GOAL

	write("��� ������: "),nl,show.
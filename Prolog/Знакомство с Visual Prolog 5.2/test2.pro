domains
	/*��������� ����
	integer
	real
	string
	symbol
	file
	*/
	utype = integer /* ������� ����� ���������������� ���, ������� ��������� � ����� integer*/
	/* utype = integer*    (���� � ����� ����� * , �� utype ������ ������ ����� �����)*/
	
predicates
nondeterm	sum(utype, utype, utype) /*nondeterm - ������ �������� ����� �� ������������ �������*/
	
clauses /*����� ����� ����������� ����� � ������� */
	sum(0, 1, 1). /*�����������0+1=1 */
	sum(1, 2, 3). 
	sum(3, 0, 3).
	sum(2, 2, 4). 
goal
	/*sum(1, 2, 3). */
	sum(X, Y, 3).
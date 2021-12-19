domains
	/*¬озможные типы
	integer
	real
	string
	symbol
	file
	*/
	utype = integer /* —оздали новый пользовательский тип, который совпадает с типом integer*/
	/* utype = integer*    (≈сли в конце стоит * , то utype теперь список целых чисел)*/
	
predicates
nondeterm	sum(utype, utype, utype) /*nondeterm - данный предикат имеет не единственное решение*/
	
clauses /*«десь могут указыватьс€ факты и правила */
	sum(0, 1, 1). /* омментарий0+1=1 */
	sum(1, 2, 3). 
	sum(3, 0, 3).
	sum(2, 2, 4). 
goal
	/*sum(1, 2, 3). */
	sum(X, Y, 3).
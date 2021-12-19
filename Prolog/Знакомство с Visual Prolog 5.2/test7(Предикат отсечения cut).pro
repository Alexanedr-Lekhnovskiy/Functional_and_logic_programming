PREDICATES
	nondeterm findcar(symbol, symbol)
	nondeterm car(symbol, symbol, integer)
	nondeterm color(symbol, symbol)
	
CLAUSES
	/* '!' - отсечение, заставляет отбрасывать систему альтернативные варианты */
	/*findcar(Model, Color):- car(Model,Color,Price), color(Color,"светлый"),!,Price < 25000. */
	findcar(Model, Color):- car(Model,Color,Price), color(Color,"темный"),!,Price < 25000.
	
	car("москвич","синий",12000). 
	car("жигули","зелёный",26000).
	car("вольво","синий",24000).
	car("волга","синий",20000).
	car("ауди","зелёный",20000).
	
	color("синий", "темный").
	color("зелёный", "светлый").
	
GOAL
	findcar(X,Y).
	
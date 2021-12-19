DOMAINS
nazvanie, stolica = symbol
naselenie_mln = integer
territoria = real

PREDICATES
nondeterm strana(nazvanie,naselenie_mln,territoria,stolica)

CLAUSES
strana(kitai, 1200, 9597000, pekin).
strana(belgia, 10, 30000, brussel).
strana(peru, 20, 1285000, lima).

GOAL
strana(X,_,Y,_), Y > 1000000, write(X),nl.
directlyin(natasha, katarina).
directlyin(katarina, olga).
directlyin(olga, anna).
directlyin(anna, irina).

in(X, Y) :- directlyin(X, Y).
in(X, Y) :- directlyin(X, Z), in(Z, Y).

% :- in(katarina, natasha).

% Query: in(olga, katarina).

% Query: in(olga, irina).

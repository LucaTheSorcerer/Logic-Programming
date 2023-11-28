compare_numbers(X, Y) :-
    X >= Y,
    write(X), write(' is greater or equal '), write(Y).
compare_numbers(X, Y) :-
    X < Y,
    write(X), write(' is less than '), write(Y).


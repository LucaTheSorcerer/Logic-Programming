countdown(X) :- X > 0, write(X), nl, Next is X - 1, countdown(Next).
countdown(0).

% To use the program, query:
% countdown(10).

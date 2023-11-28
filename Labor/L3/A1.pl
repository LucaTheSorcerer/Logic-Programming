% Define the connected relationships
connected(1,2). 
connected(3,4). 
connected(5,6). 
connected(7,8).
connected(9,10). 
connected(12,13). 
connected(13,14). 
connected(15,16). 
connected(17,18). 
connected(19,20). 
connected(4,1). 
connected(6,3). 
connected(4,7). 
connected(6,11).
connected(14,9). 
connected(11,15). 
connected(16,12). 
connected(14,17). 
connected(16,19).

% Define the path predicate
path(X, Y) :- connected(X, Y).
path(X, Y) :- connected(X, Z), path(Z, Y).

% Define a predicate to print a list of points
print_points([]).
print_points([H|T]) :- write(H), write(' '), print_points(T).

% Define a predicate to find and print reachable points from a starting point
print_reachable(Start) :-
    findall(End, path(Start, End), ReachablePoints),
    write('Reachable points from '), write(Start), write(': '), nl,
    print_points(ReachablePoints).

% Example usage:
% To print reachable points from point 5:
% :- print_reachable(5).
%
% To print reachable points from point 1:
% :- print_reachable(1).
%
% To print reachable points from point 13:
:- print_reachable(13).

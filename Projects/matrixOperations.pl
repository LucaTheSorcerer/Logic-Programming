% Transpose a matrix
transpose([], []).
transpose([F|Fs], Ts) :-
    transpose(F, [F|Fs], Ts).

transpose([], _, []).
transpose([_|Rs], Ms, [Ts|Tss]) :-
    lists_firsts_rests(Ms, Ts, Ms1),
    transpose(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
    lists_firsts_rests(Rest, Fs, Oss).

% Matrix multiplication
matrix_mult(Matrix1, Matrix2, ResultMatrix) :-
    transpose(Matrix2, TransposedMatrix2),
    matrix_mult_(Matrix1, TransposedMatrix2, ResultMatrix).

matrix_mult_([], _, []).
matrix_mult_([Row|Matrix1], Matrix2, [ResultRow|ResultMatrix]) :-
    matrix_mult_row(Row, Matrix2, ResultRow),
    matrix_mult_(Matrix1, Matrix2, ResultMatrix).

matrix_mult_row(_, [], []).
matrix_mult_row(Row, [Col|Matrix2], [Result|RestResult]) :-
    dot_product(Row, Col, Result),
    matrix_mult_row(Row, Matrix2, RestResult).

dot_product([], [], 0).
dot_product([X1|Xs], [Y1|Ys], Result) :-
    dot_product(Xs, Ys, RestResult),
    Result is X1 * Y1 + RestResult.

% Define matrices
matrix1([[1,2,3],
         [4,5,6],
         [7,8,9]]).

matrix2([[9,8,7],
         [6,5,4],
         [3,2,1]]).

% Multiply matrices
:- matrix1(Matrix1),
   matrix2(Matrix2),
   matrix_mult(Matrix1, Matrix2, Result),
   write('Result of Matrix Multiplication: '), writeln(Result).



% Calculate the determinant of a 2x2 matrix
determinant([[A,B],[C,D]], Det) :-
    Det is A*D - B*C.

% Calculate the adjugate of a 2x2 matrix
adjugate([[A,B],[C,D]], [[D,-B],[-C,A]]).

% Invert a 2x2 matrix
invert(Matrix, InvMatrix) :-
    determinant(Matrix, Det),
    adjugate(Matrix, AdjMatrix),
    scalar_mult(1/Det, AdjMatrix, InvMatrix).

% Multiply a matrix by a scalar
scalar_mult(_, [], []).
scalar_mult(S, [Row|Matrix], [ResultRow|ResultMatrix]) :-
    scalar_mult_row(S, Row, ResultRow),
    scalar_mult(S, Matrix, ResultMatrix).

scalar_mult_row(_, [], []).
scalar_mult_row(S, [X|Row], [Result|ResultRow]) :-
    TempResult is S*X,
    Result is round(TempResult * 100) / 100,  % Round to 2 decimal places
    scalar_mult_row(S, Row, ResultRow).


% Define a matrix
matrix([[4,7],[2,6]]).

% Invert the matrix
:- matrix(Matrix),
   invert(Matrix, InvMatrix),
   write('Inverted Matrix: '), writeln(InvMatrix).
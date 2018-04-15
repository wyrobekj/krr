%%%%%%%%%%%
% REMINDER 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% There's something missing here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
include "alldifferent.mzn";
include "globals.mzn";
%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial state of the board
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%% 
% VARIABLES  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You know...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: S = 3;
int: N = S*S;
array[1..N, 1..N] of int: board;
set of int: PuzzleRange = 1..N;
array [1..N, 1..N] of var 1..N:puzzle;
%%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - you know the sudoku rules
% - remember, that you have to preserve the initial state of the board  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constraint forall(i,j in PuzzleRange)(if board[i,j]>0 then puzzle[i,j]=board[i,j] else true endif);
constraint forall(i in PuzzleRange)(alldifferent(j in PuzzleRange)(puzzle[i,j]));
constraint forall(j in PuzzleRange)(alldifferent(i in PuzzleRange)(puzzle[i,j]));
%constraint forall (i in PuzzleRange) ( alldifferent( [ puzzle[i,j] | j in PuzzleRange ]) ); % All different in columns.
%constraint forall (j in PuzzleRange) ( alldifferent( [ puzzle[i,j] | i in PuzzleRange ]) );
constraint forall(a,b in 1..3)(alldifferent(c, d in 1..3)( puzzle[(a-1)*S+c,(b-1)*S+d] ));
solve satisfy;

%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - puzzle - 2d array of nxn variables
% - N - size of the board, equal S*S         
% - S - size of a single sector            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ show(puzzle[i,j]) ++ " " ++
  if j mod S == 0 then " " else "" endif ++ if j == N /\ i != N then
  if i mod S == 0 then "\n\n" else "\n" endif else "" endif
    | i,j in PuzzleRange ] ++ ["\n"];
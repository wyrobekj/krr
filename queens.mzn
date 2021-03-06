include "globals.mzn";

%%%%%%%%%%%%%
% VARIABLES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add variables with correct domains 
% tip:                       
% var 1..N: x; declares a variable with domain 1..N   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: N = 10;
var 1..N: columns;
array[1..N] of var 1..N: rows;

%%%%%%%%%%%%%
% CONSTRAINTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% add constraints
% tip:
% row_i = row_j (-/+) (j - i)                 
% matches queens placed on the same diagonal, where:
% - i,j - column index
% - row_n - queen's position in the nth col 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

constraint alldifferent(rows);
constraint forall([rows[i] != rows[j]+(j-i) | i,j in 1..N where i<j]);
constraint forall([rows[i] != rows[j]-(j-i) | i,j in 1..N where i<j]);

solve satisfy; 
  
%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - rows[i] - queen's position in the ith row 
% - N - number of queens                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ if fix(rows[j]) == i then "H" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
include "alldifferent.mzn";
include "inverse.mzn";

int: N = 16;
set of int: indexes = 1..N;

array[indexes] of var indexes: rows;
array[indexes] of var indexes: cols;

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in indexes]);
constraint alldifferent([rows[i] - i | i in indexes]);

constraint all_different(cols);
constraint all_different([cols[i]+i | i in 1..N]);
constraint all_different([cols[i]-i | i in 1..N]);

constraint inverse(rows, cols);

solve satisfy; 
  
output [ if fix(rows[j]) == i then "Q" else "_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
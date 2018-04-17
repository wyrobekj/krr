int: n = 150;
set of int: range = 0..n-1;
array[range] of var range: magic;
  
constraint forall(i in range)(
  magic[i] = sum([bool2int(i == magic[j]) | j in range])
);

% tutaj należy wstawić nadmiarowe ograniczenia
% what should be equal the sum of the magic sequence?
constraint sum(i in range)(magic[i])=n;

% what should be equal the sum of sequence elements multiplied by their indexes (if indexing starts from 0)?
constraint sum(i in range)(magic[i]*i)=n;

solve satisfy;
  
output [ "magiczny ciag = ", show(magic),";\n"];
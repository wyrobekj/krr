include "globals.mzn";

%%%%%%%%%%%%%% 
% PARAMETERS        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Length of the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: L = 10;
set of int: elements = 0..L;
%%%%%%%%%%%%%% 
% VARIABLES        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sequence itself
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
array[elements] of var int: magic;
%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tips:                                 
% - sum(array) return sum of the array's elements 
% - you can use bool's like integers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constraint forall(i in elements)(magic[i] = sum([magic[j]=i|j in elements]));
  
solve satisfy;
  
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output [ "magic sequence = ", show(magic),";\n"];
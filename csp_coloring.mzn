% parameters
int: nodesNumber;
array [1..nodesNumber, 1..nodesNumber] of bool: edges;
int: minColorsNumber;
array[1..7] of var 1..7: maxClique;

% decision variables
var minColorsNumber..nodesNumber: colorsNumber;
array [1..nodesNumber] of var 1..nodesNumber: nodes;

% constraints
constraint colorsNumber = max(nodes);

constraint forall([nodes[maxClique[i]]=i | i in 1..minColorsNumber]);

constraint forall (i,j in 1..nodesNumber where i < j /\ edges[i,j])(
  nodes[i] != nodes[j]
);

% goal
solve minimize colorsNumber;

% output
output [show(colorsNumber), " colors\n",] ++
       [show(nodes[i]) ++ " " | i in 1..nodesNumber]
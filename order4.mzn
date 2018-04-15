% Please add another parameter called yumyum_factors. 
% It should be an array of integers, which say how much we like a particular meal (bigger the number is, more we like the meal).
% We are looking for a solution, which maximizes the sum of the yumyum factors in our order.
% We don't have to spend all the money we have.

int:menu_length;
int:money_limit;
array[1..menu_length] of int: menu_prices;
array[1..menu_length] of string: menu_names;
array[1..menu_length] of var int: order;
array[1..menu_length] of int: yumyum_factors;

constraint forall([order[i] >= 0 | i in 1..menu_length]);
constraint sum([ order[i] * menu_prices[i] | i in 1..menu_length]) <= money_limit;

solve maximize sum([order[i] * yumyum_factors[i] | i in 1..menu_length]);
%solve satisfy;

output [menu_names[i] ++ ": " ++ show(order[i]) ++ "\n" | i in 1..menu_length];
output["total price of the order:"];
output [show(fix(sum([ order[i] * menu_prices[i] | i in 1..menu_length])))];


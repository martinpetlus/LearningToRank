function J = computeCost(X, y, theta)


m = length(y);	% Number of training examples

J = (1 / (2 * m)) * (((X * theta) - y)' * ((X * theta) - y));


end
function [Loss, grad] = LogisticLossFMINUNC(w, X, y)

	m = length(y);

	Loss = (1 / m) * sum(-y .* log(sigmoid(X * w)) - (1 - y) .* log(1 - sigmoid(X * w)));

	grad = (1 / m) * ((sigmoid(X * w) - y)' * X)';

end
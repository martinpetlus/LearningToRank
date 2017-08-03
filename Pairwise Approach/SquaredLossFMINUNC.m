function [Loss grad] = SquaredLossFMINUNC(w, X, y, lambda)

	Loss = 0;
	[m n] = size(X);
	
	_w = [0 ; w(2:n)];

	Loss = (1 / (2 * m)) * (((X * w) - y)' * ((X * w) - y)) + (lambda / (2 * m)) * (w(2:n)' * w(2:n));
	
	grad = (1 / m) * (((X * w) - y)' * X)' + (lambda / m) .* _w;

end
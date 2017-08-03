function [theta] = normalEqnReg(X, y, lambda)

	[m n] = size(X);
	
	reg = eye(n, n);
	reg(1, 1) = 0;
	
	theta = pinv(X' * X + lambda .* reg) * X' * y;

end

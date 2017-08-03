function c = comb(n, k)

	c = factorial(n) / (factorial(n - k) * factorial(k));

end
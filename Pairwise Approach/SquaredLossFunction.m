function Loss = SquaredLossFunction(w, X, y, pairs)

	num_pairs = size(pairs, 1);
	sum = 0;
	
	for i = 1:num_pairs
	
		x  = X(pairs(i, 1), :) - X(pairs(i, 2), :);
		x(1) = 1;
		yy = sign(y(pairs(i, 1)) - y(pairs(i, 2)));
		
		sum += loss(w, x', yy);
	
	end
	
	Loss = sum / num_pairs;

end
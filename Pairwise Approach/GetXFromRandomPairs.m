function [X y] = GetXFromRandomPairs(D, numberOfPairs)

	n = size(D(1, 3:end), 2);

	X = zeros(numberOfPairs, n);
	y = zeros(numberOfPairs, 1);
	
	for i = 1:numberOfPairs
	
		[a ya b yb idxa idxb] = GetRandomPair(D);
		
		X(i, :) = a - b;
		X(1) = 1;
		y(i) = sign(ya - yb);
	
	end

end
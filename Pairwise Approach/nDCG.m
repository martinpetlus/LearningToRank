function ndcg = nDCG(y)

	s = sort(y, 'descend');
	
	sum1 = 0;
	sum2 = 0;

	for i = 1:min(10, length(y))
	
		sum1 += (2 ** y(i) - 1) / log2(i + 1);
		sum2 += (2 ** s(i) - 1) / log2(i + 1);
	
	end

	ndcg = sum1 / sum2;
	
end
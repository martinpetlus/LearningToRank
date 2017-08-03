function ndcg = checknDCG(w, fileName, mu, sigma)

	[y qid X] = loadData(fileName);
	
	[m n] = size(X);
	
	X = bsxfun(@minus, X, mu);
	X = bsxfun(@rdivide, X, sigma);
	X = [ones(m, 1) X];
	
	score = X * w;
	[s i] = sort(score, 'descend');
	
	ndcg = nDCG(y(i));

end
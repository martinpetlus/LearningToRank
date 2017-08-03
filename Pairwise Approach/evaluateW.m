function evaluateW(w, fileName, mu, sigma)


[labels qid X] = loadData(fileName);

% m is number of test examples,
% n is number of features
[m n] = size(X);

% Normalize test examples
X = bsxfun(@minus, X, mu);
X = bsxfun(@rdivide, X, sigma);

X = [ones(m, 1) X];	% Add column of ones

y = X * w;	% Compute predicted relevance scores

% Matrix with start and end index of every query
qidIdx = [];

queryStart = 1;

% Compute indices where every query starts and ends
for i = 1:m

	if (i + 1 > m) || (qid(i) != qid(i + 1))
		queryEnd = i;
		qidIdx = [qidIdx ; [queryStart queryEnd]];
		queryStart = i + 1;
	end

end

ranks = zeros(m, 1);
errAndNdcg = [];
numOfQueries = size(qidIdx, 1);

% Compute Err and nDCG for each query
for i = 1:numOfQueries

	queryStart = qidIdx(i, 1);
	queryEnd   = qidIdx(i, 2);

	% Sort query documents by they predicted relevance scores
	[s idx] = sort(y(queryStart:queryEnd), 'descend');
	
	% Number of documents of query
	numOfDocs = queryEnd - queryStart + 1;
	
	% Write predicted ranks
	for j = 1:numOfDocs
	
		ranks(idx(j)) = j;
	
	end
		
	[Err nDCG] = evaluateSubmission(labels(queryStart:queryEnd), ranks(1:numOfDocs));
	errAndNdcg = [errAndNdcg ; [qid(queryStart) Err nDCG]];
	
end

% fprintf(' First 10 ranks:\n');
% fprintf('\trank\tlabel\ty\n');
% fprintf('\t%d\t%d\t%f\n', [labels(idx(1:10)) ranks(idx(1:10)) y(idx(1:10), 2)]');
% fprintf('\n');

fprintf('qid = %d, Err = %f, nDCG = %f\n', errAndNdcg');
fprintf('\n');

fprintf('Mean values:  Err = %f, nDCG = %f\n\n', ...
		mean(errAndNdcg(:, 2)), mean(errAndNdcg(:, 3)));


end